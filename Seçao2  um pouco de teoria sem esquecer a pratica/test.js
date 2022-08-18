let verdade = true;
let mentira = false;

let resultado3 = mentira || bomDia();
console.log("O resultado3 = " + resultado3);

function bomDia() {
    console.log("Bom DIa");
    return true;
}