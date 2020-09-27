const {get} = require('axios');

const metadataServerURL =
  'http://metadata/computeMetadata/v1/instance/service-accounts/default/token';

exports.whoami = async (req, res) => {
  // Fetch the token and return to client
  try {
    const functionResponse = await get(metadataServerURL, {
        headers: {
            'Metadata-Flavor': 'Google',
        }});
    res.status(200).send(functionResponse.data);
  } catch (err) {
    console.error(err);
    res.status(500).send('An error occurred! See logs for more details.');
  }
};