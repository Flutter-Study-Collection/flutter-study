const axios = require('axios');
const moment = require('moment');

const since = moment().day(6).hour(12).minute(0).second(0).subtract(2, 'weeks').toISOString();
const until = moment().day(6).hour(12).minute(0).second(0).toISOString();

axios.get('https://api.github.com/repos/Flutter-Study-Collection/flutter-study/commits?since=' + since + '&until=' + until)
  .then(response => {
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
  })
  .catch(error => {
    console.error(error);
  });
