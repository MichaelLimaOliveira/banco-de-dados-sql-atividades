let final = [0, 0, 0, 0, 0, 0, 0, 0];

function geradorAleatorio() {
    let rnd = Math.trunc(Math.random() * (8 - 1) + 1);
    console.log(rnd);
    return rnd;
}
let posicoes = [0, 0, 0, 0, 0, 0, 0, 6];
for (let i = 0; i < 3; i++) {
    for (let j = 0; j < 7;) {
        resultado = geradorAleatorio(); 

            if(posicoes.includes(resultado)) {
                posicoes[j] = resultado;
                j++;
            };
        }
    console.log(posicoes);
}
console.log(final);
