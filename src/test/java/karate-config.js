function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'default';
  }
  var config = {
    env: env,
    p_base_url: '',
    dbHost: '',
    dbPort: '',
    dbServiceName: '',
    mqHost: '',
    mqPort: '',
    mqChannel: '',
    mqQmgr: ''
  }
  if (env == 'default') {
    // customize
    config.p_base_url = 'https://reqres.in';
    config.dbHost= 'someValue';
    config.dbPort= 'someValue';
    config.dbServiceName= 'someValue';
    config.mqHost= 'someValue';
    config.mqPort= 'someValue';
    config.mqChannel= 'someValue';
    config.mqQmgr= 'someValue';


  } else if (env == 'e2e') {
    // customize
    config.p_base_url= 'someValue';
    config.dbHost= 'someValue';
    config.dbPort= 'someValue';
    config.dbServiceName= 'someValue';
    config.mqHost= 'someValue';
    config.mqPort= 'someValue';
    config.mqChannel= 'someValue';
    config.mqQmgr= 'someValue';
  }
  return config;
}