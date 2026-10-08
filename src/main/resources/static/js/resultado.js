$(document).ready(function () {

    // Faz uma requisição GET para buscar os filmes
    $.ajax({
        url: "/filmes",
        type: "GET",

        // Recebe todos os filmes do banco
        success: function (filmes) {

            // Pega a tabela onde os filmes serão exibidos
            let tabela = $("#tabelaFilmes");

            // Percorre cada filme recebido pela API
            filmes.forEach(function (filme) {

                // Monta uma linha com os dados do filme
                let linha = `
                    <tr>
                        <td><strong>${filme.titulo}</strong></td>
                        <td>${filme.genero}</td>
                        <td>${filme.lancamento}</td>
                        <td>
                            <a href="/filme/${filme.id}" class="btn btn-primary btn-sm me-1">
                                Detalhes
                            </a>
                            <a href="/cadastro?id=${filme.id}" class="btn btn-warning btn-sm me-1">
                                Editar
                            </a>
                            <button class="btn btn-danger btn-sm btnExcluir"
                                    data-id="${filme.id}">
                                Excluir
                            </button>
                        </td>
                    </tr>
                `;

                // Adiciona a linha na tabela
                tabela.append(linha);

                // JavaScript monta a tabela dinamicamente,
                // sem precisarmos escrever cada filme manualmente no HTML
            });
        },

        error: function () {

            // Mostra uma mensagem caso não consiga buscar os filmes
            alert("Erro ao buscar os filmes.");
        }
    });

    // Quando clicar no botão de excluir
    $(document).on("click", ".btnExcluir", function () {

        // Pega o ID do filme que foi clicado
        let id = $(this).data("id");

        // Envia uma requisição para excluir o filme
        $.ajax({
            url: "/filmes/" + id,
            type: "DELETE",

            success: function () {

                // Mostra uma mensagem de sucesso
                alert("Filme excluído com sucesso!");

                // Volta para a lista de filmes
                window.location.href = "/resultado";
            },

            error: function () {

                // Mostra uma mensagem caso aconteça algum erro
                alert("Erro ao excluir filme.");
            }
        });
    });
});