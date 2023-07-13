const axios = require('axios');
const moment = require('moment');

async function run() {
    const since = moment().day(6).hour(12).minute(0).second(0).subtract(2, 'weeks').toISOString();
    const until = moment().day(6).hour(12).minute(0).second(0).toISOString();

    const response = await axios.get(`https://api.github.com/repos/${process.env.GITHUB_REPOSITORY}/commits?since=${since}&until=${until}`);

    const authors = {};
    response.data.forEach(commit => {
      const author = commit.commit.author.name;
      authors[author] = (authors[author] || 0) + 1;
    });

    const chartData = {
      type: 'bar',
      data: {
        labels: Object.keys(authors),
        datasets: [{
          label: 'Commits',
          data: Object.values(authors)
        }]
      }
    };

    const chartUrl = 'https://quickchart.io/chart?c=' + encodeURIComponent(JSON.stringify(chartData));

    console.log(chartUrl);
}

run().catch(error => console.error(error));
