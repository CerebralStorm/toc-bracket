const axios = require('axios/dist/browser/axios.cjs');


window.handleMatchupClick = function handleMatchupClick(radioButton) {
  let winnerId = radioButton.value
  let matchupSelectionId = radioButton.dataset.matchupId
  let bracketId = radioButton.dataset.bracketId
  
  let body = {
    matchup_selection: {
      winner_id: winnerId,
      bracket_id: bracketId
    }
  }

  let csrfToken = ENV.csrf_token
  let config = {
    headers: {
      "Accept": 'application/json',
      "Content-Type": 'application/json',
      "X-CSRF-Token": csrfToken
    }
  }

  axios.put(`/matchup_selections/${matchupSelectionId}`, body, config)
    .then(function (response) {
      // handle success
      console.log(response);
    })
    .catch(function (error) {
      // handle error
      console.log(error);
    })
    .finally(function () {
      // always executed
    });
}
