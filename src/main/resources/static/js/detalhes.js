$(document).ready(function () {

    // Guarda o ID da análise que está sendo editada
    let idAnaliseEdicao = null;

    // Pega o endereço atual da página
    let caminho = window.location.pathname;

    // Divide o endereço em partes
    let partes = caminho.split("/");

    // Pega o ID do filme que está na URL
    let id = partes[2];

    // Busca os dados do filme pelo ID
    $.ajax({
        url: "/filmes/" + id,
        type: "GET",

        // Recebe os dados do filme
        success: function (filme) {

            // Monta o HTML com os dados do filme
            let detalhes = `
                <div class="card-body">
                    <h2 class="card-title mb-4">${filme.titulo}</h2>

                    <p>
                        <strong>Gênero:</strong>
                        ${filme.genero}
                    </p>

                    <p>
                        <strong>Ano de lançamento:</strong>
                        ${filme.lancamento}
                    </p>

                    <hr>

                    <h5 class="mt-3">Sinopse</h5>

                    <p class="text-muted">
                        ${filme.sinopse}
                    </p>
                </div>
            `;

            // Coloca os dados do filme dentro do card
            $("#detalhesFilme").html(detalhes);
        },

        error: function () {

            // Mostra uma mensagem caso não consiga buscar o filme
            alert("Erro ao buscar o filme.");
        }
    });

    // Busca todas as análises cadastradas
    $.ajax({
        url: "/analises",
        type: "GET",

        // Recebe as análises do banco
        success: function (analises) {

            // Pega a div onde as análises serão exibidas
            let lista = $("#listaAnalises");

            // Verifica se o filme possui alguma análise
            let possuiAnalise = false;

            // Percorre todas as análises recebidas
            analises.forEach(function (analise) {

                // Verifica se a análise pertence ao filme atual
                if (analise.filme.id == id) {

                    possuiAnalise = true;

                    // Cria as estrelas de acordo com a nota
                    let estrelas = "";

                    for (let i = 1; i <= 5; i++) {

                        // Mostra uma estrela cheia
                        if (analise.nota >= i) {
                            estrelas += '<i class="bi bi-star-fill"></i>';

                        // Mostra meia estrela
                        } else if (analise.nota >= i - 0.5) {
                            estrelas += '<i class="bi bi-star-half"></i>';

                        // Mostra uma estrela vazia
                        } else {
                            estrelas += '<i class="bi bi-star"></i>';
                        }
                    }

                    // Monta o card da análise
                    let item = `
                        <div class="card shadow-sm border-0 mb-3">
                            <div class="card-body">

                                <div class="d-flex justify-content-between align-items-center mb-2">

                                    <div class="fs-4">
                                        ${estrelas}
                                    </div>

                                    <span class="badge bg-primary">
                                        ${analise.nota} / 5
                                    </span>

                                </div>

                                <p class="card-text mt-3">
                                    ${analise.analise}
                                </p>

                                <div class="mt-3">

                                    <button class="btn btn-warning btnEditarAnalise me-2"
                                            data-id="${analise.id}">
                                        Editar
                                    </button>

                                    <button class="btn btn-danger btnExcluirAnalise"
                                            data-id="${analise.id}">
                                        Excluir
                                    </button>

                                </div>

                            </div>
                        </div>
                    `;

                    // Adiciona a análise na lista
                    lista.append(item);
                }
            });

            // Se não encontrou nenhuma análise para este filme
            if (!possuiAnalise) {

                lista.html(`
                    <div class="alert alert-secondary">
                        Nenhuma análise cadastrada para este filme.
                    </div>
                `);
            }
        },

        error: function () {

            // Mostra uma mensagem caso não consiga buscar as análises
            alert("Erro ao buscar as análises.");
        }
    });

    // Quando clicar no botão de editar
    $(document).on("click", ".btnEditarAnalise", function () {

        // Pega o ID da análise clicada
        let idAnalise = $(this).data("id");

        // Busca os dados da análise pelo ID
        $.ajax({
            url: "/analises/" + idAnalise,
            type: "GET",

            success: function (analise) {

                // Guarda o ID da análise que será editada
                idAnaliseEdicao = analise.id;

                // Coloca os dados da análise no formulário
                $("#analise").val(analise.analise);
                $("#nota").val(analise.nota);

                // Mostra que o formulário está sendo usado para edição
                $("#tituloFormulario").text("Editar avaliação");
                $("#btnEnviarAnalise").text("Atualizar avaliação");

                // Leva o usuário diretamente para o formulário
                document.getElementById("formAnalise").scrollIntoView({
                    behavior: "smooth"
                });
            },

            error: function () {

                // Mostra uma mensagem caso não consiga buscar a análise
                alert("Erro ao buscar a análise.");
            }
        });
    });

    // Quando clicar no botão de excluir
    $(document).on("click", ".btnExcluirAnalise", function () {

        // Pega o ID da análise clicada
        let idAnalise = $(this).data("id");

        // Envia uma requisição para excluir a análise
        $.ajax({
            url: "/analises/" + idAnalise,
            type: "DELETE",

            success: function () {

                // Mostra uma mensagem de sucesso
                alert("Análise excluída com sucesso!");

                // Recarrega a página para atualizar a lista
                window.location.reload();
            },

            error: function () {

                // Mostra uma mensagem caso aconteça algum erro
                alert("Erro ao excluir a análise.");
            }
        });
    });

    // Quando o formulário for enviado
    $("#formAnalise").submit(function (event) {

        // Impede o formulário de recarregar a página
        event.preventDefault();

        // Cria o objeto com os dados da análise
        let novaAnalise = {
            analise: $("#analise").val(),
            nota: $("#nota").val(),

            // Informa para qual filme a análise pertence
            filme: {
                id: id
            }
        };

        // Por padrão, será feito um novo cadastro
        let url = "/analises";
        let metodo = "POST";

        // Verifica se existe uma análise sendo editada
        if (idAnaliseEdicao) {

            // Altera a URL para a análise específica
            url = "/analises/" + idAnaliseEdicao;

            // Altera o método para atualizar a análise
            metodo = "PUT";
        }

        // Envia os dados para o servidor
        $.ajax({
            url: url,
            type: metodo,

            // Informa que estamos enviando JSON
            contentType: "application/json",

            // Converte o objeto JavaScript para JSON
            data: JSON.stringify(novaAnalise),

            success: function () {

                // Verifica se foi um cadastro ou uma edição
                if (idAnaliseEdicao) {
                    alert("Análise atualizada com sucesso!");
                } else {
                    alert("Análise cadastrada com sucesso!");
                }

                // Limpa o ID da análise que estava sendo editada
                idAnaliseEdicao = null;

                // Volta o formulário para o modo de cadastro
                $("#tituloFormulario").text("Sua avaliação");
                $("#btnEnviarAnalise").text("Enviar avaliação");

                // Limpa os campos do formulário
                $("#formAnalise")[0].reset();

                // Recarrega a página para mostrar os dados atualizados
                window.location.reload();
            },

            error: function () {

                // Mostra uma mensagem caso aconteça algum erro
                alert("Erro ao salvar a análise.");
            }
        });
    });
});