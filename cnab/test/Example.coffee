params =
    ArquivoHeader:
        empresa_inscricao_tipo: '2'
        empresa_inscricao_num: '07144407000131'
        convenio: '456977'
        empresa_nome: 'Versul Tecnologias Ltda'
        nome_banco: 'HSBC'
        arquivo_data_geracao: '29082016'
        arquivo_hora_geracao: '085600'
        arquivo_sequencia: '1'
    ArquivoTrailing:
        qtde_lotes: '1'
        qtde_registros: '1'
    LoteHeader:
        servico: '10'
        forma_lancamento: '03'
        empresa_tipo_insc: '2'
        empresa_num_insc: '88867891000191'
        convenio: '111'
        empresa_nome: 'Versul Tecnologias Ltda'
    LoteTrailing:
        qtde_registros: '1'
        valor_credito: '10000'
    Detail:
        num_seq_registro_lote: '1'
        movimento_tipo: '9'
        movimento_cod: '00'
        cod_camara: '018'
        favorecido_cod_banco: '001'
        favorecido_agencia: '2027'
        favorecido_num_conta: '10904'
        favorecido_dig_verificador: '5'
        favorecido_nome: 'Andre Feijo Meirelles'
        doc_num: '153'
        data_lcto_credito: '29082016'
        valor_lcto: '10000'

Remessa = require('../../main').Remessa
remessa = new Remessa 'HSBC', 'Pagamento'
file = remessa.process params

require('expect.js')(file).to.have.length 1204

moment = require 'moment'
fileName = "PAG399_0006930_#{moment().format 'DDMMYY'}01.REM"
path = './gen_files'

fs = require 'fs'

fs.writeFile "#{path}/#{fileName}", file