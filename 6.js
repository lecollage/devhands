// //NOte: you can keep this request anywhere as setNExtRequest will get executed only after full reqeust flow completes
// //so could be used in pre-request or in test-script

// //variables creates local variable so for each collection run the initial value will be undefined , so here we set the value to 3 at start
// pm.variables.get("retryCounter") === undefined ? pm.variables.set('retryCounter', pm.variables.get("retryCount")) : null
// retryCount = pm.variables.get("retryCounter");

// if (retryCount > 1) {
//     pm.variables.set('retryCounter', --retryCount)
//     //this gives this request name , you don't have to hardcode
//     postman.setNextRequest(pm.info.requestName);
// }
// //use below else condition if you don't want to execute any equests after this request
// /*else{

// postman.setNextRequest(null);
// }*/

pm.test("Status is 200", () => {
    pm.response.to.have.status(201);

    pm.variables.get("retryCounter") === undefined ? pm.variables.set('retryCounter', pm.variables.get("retryCount")) : null
    retryCount = pm.variables.get("retryCounter");

    console.log(retryCount);

    postman.setNextRequest(pm.info.requestName);
    console.log(pm.info.requestName);
    postman.setNextRequest(pm.info.requestName)
})
