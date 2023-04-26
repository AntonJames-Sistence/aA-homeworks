function printCallback(ele) {
    // console.log(`Mx. ${ele} Jingleheimer Schmidt`);
    console.log(ele);
};



let myTitlelize = function(names ,printCallback) {
    let titleNames = names.map(name => `Mx. ${name} Jingleheimer Schmidt`)
    // let titleNames = names.map(name => name[0].toUpperCase() + name.slice(1).toLowerCase());
    titleNames.forEach(tname => printCallback(tname));
};

// myTitlelize(["mAry", "BriAn", "Leo"], printCallback);
myTitlelize(["Mary", "Brian", "Leo", 'Anton'], printCallback);
// Mx. Mary Jingleheimer Schmidt
// Mx. Brian Jingleheimer Schmidt
// Mx. Leo Jingleheimer Schmidt
// undefined