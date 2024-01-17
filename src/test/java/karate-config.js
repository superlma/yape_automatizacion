function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'cert';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    config.URLBASE = "https://restful-booker.herokuapp.dev.com"
  } else if (env == 'cert') {
    config.URLBASE = "https://restful-booker.herokuapp.com"
  }
  return config;
}