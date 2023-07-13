const { createCanvas, loadImage } = require('canvas');
const Chart = require('chart.js');
const axios = require('axios');
const moment = require('moment');

async function getCommits(owner, repo, since, until) {
    const response = await axios.get(`https://api.github.com/repos/${owner}/${repo}/commits?since=${since}&until=${until}`);
    return response.data;
}

function processData(commits) {
    const data = {};

    for (const commit of commits) {
        const date = commit.commit.author.date;
        const day = moment(date).format('YYYY-MM-DD');
        data[day] = (data[day] || 0) + 1;
    }

    return {
        labels: Object.keys(data),
        datasets: [{
            data: Object.values(data)
        }]
    };
}

async function createChart(data) {
    const canvas = createCanvas(800, 600);
    const ctx = canvas.getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data,
        options: {
            scales: {
                x: {
                    type: 'time',
                    time: {
                        unit: 'day'
                    }
                }
            }
        }
    });
    await loadImage(canvas.toDataURL()).then((image) => {
        const out = createCanvas(800, 600);
        const ctx = out.getContext('2d');
        ctx.drawImage(image, 0, 0);
        const buffer = out.toBuffer('image/png');
        require('fs').writeFileSync('chart.png', buffer);
    });
}

async function run() {
    const now = new Date();
    now.setHours(12, 0, 0, 0);
    const daysUntilSaturday = (7 - now.getDay() + 6) % 7;
    const since = new Date(now.getTime() + daysUntilSaturday * 24 * 60 * 60 * 1000);
    const until = new Date(since.getTime() + 14 * 24 * 60 * 60 * 1000);
    const commits = await getCommits('Flutter-Study-Collection', 'flutter-study', since.toISOString(), until.toISOString());
    const data = processData(commits);
    await createChart(data);
}

run();

