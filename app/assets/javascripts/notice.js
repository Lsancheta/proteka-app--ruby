$(document).ready(function(){
    // procura o elemento de notice e mostra ele na tela
    var noticeElement = $('.notice');
    noticeElement.show();

    // notice desaparece após 3 segundos
    setTimeout(function(){
        noticeElement.fadeOut();
    }, 300);
});