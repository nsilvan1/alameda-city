var idDemitir = 0
var cargoDemissao = ''
$(() => {
    $()
    $("body").hide()
    $(".criar-grupo").hide()
    $(".home").hide()
    $('.pop-up-criar-grupo').hide();
    $(".pop-up-criar-grupo-criado").hide();
    $(".id_lider").val("");
    $(".nome_grupo").val("");
    $(".criar-grupo").hide()

    $(".home-page").hide();
    $(".membros-page").hide();
    $(".bau-page").hide();
    $(".banco-page").hide();

    $(".add-membro-popup").hide();
    $(".demitir-membro-popup").hide();

    window.addEventListener("message", function (event) {
        if (event.data.action != undefined) {
            let status = event.data.action
            if (status == "abrir-criar-grupo") {
                $("body").show()
                $(".criar-grupo").show()
            } else if (status == "fechar-criar-grupo") {
                $("body").hide()
                $(".criar-grupo").hide()
                $(".home").hide()
                $('.pop-up-criar-grupo').hide();
                $(".pop-up-criar-grupo-criado").hide();
                $(".blur-criar-grupo").css("filter", "blur(0px)")
            } else if (status == "fechar") {
                $("body").hide()
                $("body").hide()
                $(".home").hide()
                $(".home-page").hide();
                $(".add-membro-popup").hide();
                $(".demitir-membro-popup").hide();
            } else if (status == "abrir") {
                var permissao = event.data.data.permissao
                if (permissao == "lider") {
                    $("#membros-option").show();
                    $("body").show()
                    $(".home").show()
                    $(".home-page").show();
                    $(".membros-page").hide();
                    $(".bau-page").hide();
                    $(".banco-page").hide();
                    $(".nome-grupo-img").attr("src", event.data.data.foto);
                    $(".nome-grupo-p").text(event.data.data.grupo)
                } else if (permissao == "membro") {
                    $("#membros-option").hide();
                    $("body").show()
                    $(".home").show()
                    $(".home-page").show();
                    $(".membros-page").hide();
                    $(".bau-page").hide();
                    $(".banco-page").hide();
                    $(".nome-grupo-img").attr("src", event.data.data.foto);
                    $(".nome-grupo-p").text(event.data.data.grupo)
                }

            }
        }
    })

    window.addEventListener("message", function (event) {
        if (event.data.action == "home-page") {
            $("#home-page-content-bem-vindo").text(`📶 ${event.data.nome}`) // altera o bem vindo com o nome de quem esta usando o painel
            $("#contador-membros-ativos").text(event.data.online) // altera o numero de membros online
            $("#contador-membros-total").text(event.data.total) // altera o numero de membros no total do grupo
            let final = '<h3 class="textoBau"> <button class="adicionar-peso">Toma um chá para atualizar</button>  </h3>'
            var dados = event.data.dados
            if (dados.length > 0){ 
            var content = `<table cellspacing='0' class='tabela-membros-home'><thead> <tr>
                            <th> Status </th>
                            <th> RG </th>
                            <th> Nome </th>
                            <th> Cargo </th>
                            <th> Última vez acordado </th>
                            </tr> </thead>`
            dados.forEach(e => {
                var hora = moment(parseInt(e.logado)).locale('pt-br').format('DD/MM - hh:mm');
                content += '<tbody> <tr class="membros-dados">'
                if(e.status == "online"){
                    content += '<td>' + `<img style="width:25px;height:25px;"src="https://cdn.discordapp.com/attachments/1020044589761036328/1029200771453042698/verde.png"/>` + '</td>';
                }else{
                    content += '<td>' + `<img style="width:25px;height:25px;"src="https://cdn.discordapp.com/attachments/1020044589761036328/1029200771906015322/vermelho.png"/>` + '</td>';
                }
                content += '<td>' + e.id + '</td>';
                content += '<td>' + e.nome + '</td>';
                content += '<td>' + e.cargo + '</td>';
                if(e.status == "online"){
                    content += '<td>' + `Agora` + '</td>';
                }else{
                    content += '<td>' + `${hora}` + '</td>';
                }
               
                content += `<td> </td></tr></tbody>`;
            })
            content += "</table>"
            final = content
            } 
            $('.home-page-content').html(final);
        }
        if (event.data.action == "membros-page") {
            var dados = event.data.dados
            var content = `<table cellspacing='0' class='tabela-membros'>
                            <thead> <tr>
                            <th> Status </th>
                            <th> RG </th>                             
                            <th> Nome </th> 
                            <th> Fone </th> 
                            <th> Cargo </th>
                            </tr> </thead>`
            var dados = event.data.dados
            dados.forEach(e => {
                content += '<tbody> <tr class="membros-dados-2"> '
                if(e.status == "online"){
                    content += '<td>' + `<img style="width:25px;height:25px;"src="https://cdn.discordapp.com/attachments/1020044589761036328/1029200771453042698/verde.png"/>` + '</td>';
                }else{
                    content += '<td>' + `<img style="width:25px;height:25px;"src="https://cdn.discordapp.com/attachments/1020044589761036328/1029200771906015322/vermelho.png"/>` + '</td>';
                }
                content += '<td>' + `${e.id}` + '</td>';
                content += '<td>' + e.nome  + '</td>';
                content += '<td>' + e.phone  + '</td>';
                content += '<td>' + e.cargo + '</td>';
                content += `<td><button class="promover-btn" id="promover-${e.id}+${e.cargo}">Promover</button></td>`;
                content += `<td><button class="demitir-btn" id="demitir-${e.id}+${e.cargo}">Demitir </button></td>`;
                content += `<td> </td></tr></tbody>`;
            })
            content += "</table>"
            $('.membros-page-table').html(content);
            $(".demitir-btn").on("click", function () {
                $(".demitir-membro-popup").show();
                var parametros = $(this).attr("id").replace("demitir-", "")
                let parametrosArrau = parametros.split('+')
                $(".demitir-do-grupo").attr("id", `demitir2-${parametrosArrau[0]}`)                
                idDemitir = parametrosArrau[0];
                cargoDemissao =  parametrosArrau[1];
            })
            $(".promover-btn").on("click", function () {
                var parametros = $(this).attr("id").replace("promover-", "")
                let parametrosArrau = parametros.split('+')
                fetch("https://illegal_painel/promover-membro", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: JSON.stringify({
                        id: parametrosArrau[0],
                        cargo :  parametrosArrau[1]
                    })
                })
            })
        }
        if (event.data.action == "close-demitir") {
            $(".demitir-membro-popup").hide();
        }
        if (event.data.action == "bau-page") {
            let pesototal = 0 ;
            let pesoTotalBau = 0;
            let final = '<h3 class="textoBau"> <button class="adicionar-peso"> Este báu está vazio </button>  </h3>'
            var dados = event.data.dados;         

            const nameList2 = dados.sort((a, b) => (a.type > b.type) ? 1 : -1);
            if(nameList2.length > 0 ){
                var content = `<table cellspacing='0' class='tabela-bau'><thead> <tr> 
                            <th> IMG </th>
                            <th> Tipo </th>
                            <th> Item </th> 
                            <th> Quantidade </th> 
                            <th> Peso </th> 
                            </tr> </thead>`
                pesoTotalBau = nameList2[0].pesoBau ? nameList2[0].pesoBau : 0
                for (let x = 0; x < nameList2.length; x++) {
                    pesototal += (Number(nameList2[x].peso)*Number(nameList2[x].amount) )
                    content += `<tbody> <tr class="bau-dados-2">
                                <td> <img class="imgBau" src='nui://inventory/web-side/images/${nameList2[x].index}.png' ></img>
                                <td> ${nameList2[x].type} </td>   
                                <td> ${nameList2[x].name} </td>
                                <td>  ${nameList2[x].amount} x </td>
                                <td>  ${nameList2[x].peso} kg </td>
                                </tr></tbody>`;
                }      
                content += "</table>"          
                final = `<h3 class="textoBau"> <button class="adicionar-peso"> Baú: usado ${pesototal} kg de ${pesoTotalBau} kg </button> </h3>` + content
            }            
            $('.bau-page-table').html(final);

        }
        if (event.data.action == "banco-page") {
            let content = '<h3 class="textoBau"> <button class="adicionar-peso"> Esta conta está vazia </button>  </h3>'
            var dados = event.data.dados
            if (event.data.permissao === false) {
                $(".remover-saldo").hide();
            }
            if (dados.length > 0) {
                content = "<table cellspacing='0' class='tabela-bau'><thead> <tr> <th> RG </th>  <th> Nome </th> <th> Valor </th> <th> Ação </th> <th> Data e Hora </th> </tr> </thead>"
                dados.forEach(e => {
                    date = e.data_transacao.substr(0,10).split('-')
                    var hora = date[2]+'/'+ date[1] + ' ' + e.data_transacao.substr(11,15);
                    var acao = "https://cdn.discordapp.com/attachments/1020044589761036328/1029191136885092412/down.png"
                    if (e.deposito == "true") acao = "https://cdn.discordapp.com/attachments/1020044589761036328/1029191137266778213/uplo.png"
                    content += '<tbody> <tr class="bau-dados-2">';
                    content += '<td>' +  `${e.membro_id}` + '</td>';
                    content += '<td>' + e.membro +  '</td>';
                    content += '<td>R$ ' + e.valor + '</td>';
                    content += '<td>' + `<img src='${acao}' ></img>` + '</td>';
                    content += '<td>' + `${hora}` + '</td>';
                    content += `<td> </td></tr></tbody>`;
                })
                content += "</table>"
            }

            $('.banco-page-table').html(content);
            function numberWithCommas(x) {
                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            }
            $(".saldo").text("💲 " + numberWithCommas(event.data.saldo))
        }
    })

    $(".demitir-do-grupo").click(function (id) {
        var id = idDemitir
        fetch(`https://illegal_painel/demitir-membro`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                id: id,
                cargo: cargoDemissao
            })
        })

    })

    $(".criar-grupo-btn").click(function () {
        $(".pop-up-criar-grupo").show();
        $(".blur-criar-grupo").css("filter", "blur(5px)")
        $(".blur-criar-grupo").css("transition", "0.25s filter linear")

    })

    $('.id_lider').on('input', function (e) {
        $(this).val($(this).val().replace(/[^0-9]/g, ''))
    });


    $(document).on('keyup', function (e) {
        if (e.key == "Escape") $.post(`http://${GetParentResourceName()}/fechar`);
    });


    $(".pop-up-criar-grupo-sim").click(function () {
        var id_lider = $(".id_lider").val();
        var nome_grupo = $(".nome_grupo").val();
        $(".id_lider").val("");
        $(".nome_grupo").val("");
        $(".pop-up-criar-grupo").hide();
        $(".pop-up-criar-grupo-criado").show();
        fetch(`https://${GetParentResourceName()}/criargrupo`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                nome: nome_grupo,
                lider: id_lider
            })
        }).then(resp => resp.json())
    })

    $(".pop-up-criar-grupo-criado-btn").click(function () {
        $(".pop-up-criar-grupo-criado").hide();
        $(".blur-criar-grupo").css("filter", "blur(0px)")
        $(".blur-criar-grupo").css("transition", "0.25s filter linear")
        $.post(`http://${GetParentResourceName()}/fechar`)
    })

    $(".nav-bar-item").click(function () {
        $(this).find('.nav-item-p').addClass("activeBorde")
        $(".nav-item-p").removeClass("activeBorde")
    })

    $("#home-p").click(function () {
        $(".home-page").show();
        $(".membros-page").hide();
        $(".bau-page").hide();
        $(".banco-page").hide();
    })

    $("#membros-p").click(function () {
        $(".home-page").hide();
        $(".membros-page").show();
        $(".bau-page").hide();
        $(".banco-page").hide();
        $.post(`http://${GetParentResourceName()}/membros-page`);
    })

    $("#bau-p").click(function () {
        $(".home-page").hide();
        $(".membros-page").hide();
        $(".bau-page").show();
        $(".banco-page").hide();
        $.post(`http://${GetParentResourceName()}/bau-page`);
    })

    $("#banco-p").click(function () {
        $(".home-page").hide();
        $(".membros-page").hide();
        $(".bau-page").hide();
        $(".banco-page").show();
        $.post(`http://${GetParentResourceName()}/banco-page`);
    })

    $(".adicionar-ao-grupo").click(function () {
        $(".add-membro-popup").show();
    })

    $('.id-a-ser-adicionado').on('input', function (e) {
        $(this).val($(this).val().replace(/[^0-9]/g, ''))
    });

    $(".cancelar-botao-grupo").on('click', function () {
        $(".add-membro-popup").hide();
        $(".id-a-ser-adicionado").val("");
    })

    $(".cancelar-demitir-botao-grupo").on("click", function () {
        $(".demitir-membro-popup").hide();
    })

    $(".adicionar-botao-grupo").on('click', function () {
        $(".add-membro-popup").hide();
        var id = $(".id-a-ser-adicionado").val();
        $(".id-a-ser-adicionado").val("");
        fetch(`https://${GetParentResourceName()}/add-membro`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                id: id
            })
        })
    })

    $(".adicionar-saldo").on("click",function(){
        $.post(`http://${GetParentResourceName()}/adicionar-saldo`);
    })

    $(".remover-saldo").on("click", function(){
        $.post(`http://${GetParentResourceName()}/remover-saldo`);
    })
})