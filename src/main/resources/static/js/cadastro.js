$(document).ready(function () {

    // Pega os parâmetros que estão na URL
    let parametros = new URLSearchParams(window.location.search);

    // Pega o ID do filme que está na URL
    let id = parametros.get("id");

    // Se existir um ID, busca o filme para editar
    if (id) {

        $.ajax({
            url: "/filmes/" + id,
            type: "GET",

            // Preenche o formulário com os dados do filme
            success: function (filme) {

                $("#titulo").val(filme.titulo);
                $("#genero").val(filme.genero);
                $("#lancamento").val(filme.lancamento);
                $("#sinopse").val(filme.sinopse);
            },

            // Mostra uma mensagem caso aconteça algum erro
            error: function () {

                alert("Erro ao buscar o filme.");
            }
        });
    }

    // Executa quando o formulário for enviado
    $("#formCadastro").submit(function (event) {

        // Impede o recarregamento da página
        event.preventDefault();

        // Cria o objeto com os dados do formulário
        let filme = {
            titulo: $("#titulo").val(),
            genero: $("#genero").val(),
            lancamento: $("#lancamento").val(),
            sinopse: $("#sinopse").val()
        };

        // Por padrão, será feito um novo cadastro
        let url = "/filmes";
        let metodo = "POST";

        // Se existir um ID, atualiza o filme
        if (id) {
            url = "/filmes/" + id;
            metodo = "PUT";
        }

        // Envia os dados para a API
        $.ajax({
            url: url,
            type: metodo,
            contentType: "application/json",

            // Converte o objeto JavaScript para JSON
            data: JSON.stringify(filme),

            // Se der certo, volta para a lista de filmes
            success: function () {

                alert("Filme salvo com sucesso!");

                window.location.href = "/resultado";
            },

            // Mostra uma mensagem caso aconteça algum erro
            error: function () {

                alert("Erro ao salvar filme.");
            }
        });
    });
});