function KeyPressValidate(txtName, type)
{
    if ((txtName == "") || (txtName == null))
    {
        return false;
    }

    var int = "0123456789";
    var alfaLcase = "qwertyuiopasdfghjklzxcvbnm ";
    var alfaUcase = "QWERTYUIOPASDFGHJKLZXCVBNM";
    var alfaAcent = "������������������������������������";
    var others = "!@#$%&*(){}[]|\/<>,.-_=+?";

    var rtn = false;

    switch (type)
    {
        case 1:
        {
            if (int.indexOf(txtName) >= 0)
            {
                rtn = true;
            }
            break;
        }
        case 2:
        {
            valida = alfaLcase + alfaUcase + alfaAcent + int + others;
            if (valida.indexOf(txtName) >= 0)
            {
                rtn = true;
            }
            break;
        }
    }

    return rtn;
}
function SetaRadioButton(Grid, atual) {
    re = new RegExp(Grid);

    for (i = 0; i < document.forms[0].elements.length; i++) {
        elm = document.forms[0].elements[i]
        if (elm.type == 'radio') {
            if (re.test(elm.name)) {
                elm.checked = false;
            }
        }
    }

    atual.checked = true;
}

function validaCampo(txtName, tamanho)
{
    if ((txtName == null) || (txtName == "") || (txtName.length < tamanho))
    {
        return false;
    }
    else
    {
        return true;
    }
}
function desmarcaRadioButton(obj) {
    // var xx = obj;
    var numero_item;
    numero_item = "";
    for (var i = 0; i < document.forms(0).elements.length; i++) {
        var e = document.forms(0).elementsIdea;
        if (e.type == "radio") {
            e.checked = false;
        }
    }
    obj.checked = true;
}
function fMaskDate(src) {
    if (((event.keyCode) > 47) && ((event.keyCode) < 58)) {
        mask = '##/##/####';

        var i = src.value.length;
        var saida = mask.substring(0, 1);
        var texto = mask.substring(i);
        if (texto.substring(0, 1) != saida)
            src.value += texto.substring(0, 1);

        if (i > 9)
            return false
        else
            return (true)
    }
    else
        return (false)
}
function fLimitaTexto(scr)
{
    var i = scr.value.length;
    if (i <= 144)
        return true;
    else
        return false;
}
function selectIndice(campo)
{
    if (campo.selectedIndex != 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

function verRadio(campo)
{
    var checado = false;

    var i;
    for (i = 0; i < campo.length; i++)
    {
        if (campo[i].checked == true)
        {
            checado = true;
        }
    }
    return checado;
}

function moveItemComboBox(obj, nMove)
{
    var total = obj.length;
    var aItem = obj.selectedIndex;
    var nItem = (aItem + nMove);

    if (aItem == -1)
    {
        window.alert('Escolha um item.');
    }
    else if (aItem == 0 && nMove == -1)
    {
        window.alert('O item j� est� no topo da hierarquia.');
    }
    else if (aItem == (total - 1) && nMove == 1)
    {
        window.alert('O item j� est� no final da hierarquia.');
    }
    else
    {
        var itemAValue = obj.options[aItem].value;
        var itemAText = obj.options[aItem].text;

        var itemBValue = obj.options[nItem].value;
        var itemBText = obj.options[nItem].text;

        obj.options[aItem].value = itemBValue;
        obj.options[aItem].text = itemBText;

        obj.options[nItem].value = itemAValue;
        obj.options[nItem].text = itemAText;

        obj.selectedIndex = nItem;
    }

}

function rtnPosY(e)
{
    var posy = 0;
    if (!e)
        var e = window.event;
    if (e.pageX || e.pageY)
    {
        posy = e.pageY;
    }
    else if (e.clientX || e.clientY)
    {
        posy = e.clientY + document.body.scrollTop;
    }
    return posy;
}

function rtnPosX(e)
{
    var posx = 0;
    if (!e)
        var e = window.event;
    if (e.pageX || e.pageY)
    {
        posx = e.pageX;
    }
    else if (e.clientX || e.clientY)
    {
        posx = e.clientX + document.body.scrollLeft;
    }
    return posx;
    // posx and posy contain the mouse position relative to the document
    // Do something with this information
}

function checkAll(chk)
{
    if (eval('document.frm.' + chk + '.checked') == true)
    {
        Status = 1;
    }
    else
    {
        Status = 0;
    }
    for (var n in document.frm)
    {
        if (n.substring(0, chk.length) == chk)
        {
            eval("document.frm." + n + ".checked = " + Status);
        }
    }
}

function podeExcluir()
{
    if (confirm("Voc� tem certeza que deseja excluir este item ?"))
    {
        return (true)
    }
    else
    {
        return (false)
    }
}

function unformatDados(valor)
{
    if ((valor == "") || (valor == null))
    {
        return "";
    }
    resposta = "";
    for (i = 0; i < valor.length; i++) {
        if ((valor.charAt != ".") && (valor.charAt != ",")
                  && (valor.charAt != "-") && (valor.charAt != "/")) {
            resposta = resposta + valor.charAt;
        }
    }
    return resposta;
}

function formatar(src, mask)
{
    var i = src.value.length;
    var saida = mask.substring(0, 1);
    var texto = mask.substring(i);
    if (texto.substring(0, 1) != saida)
        src.value += texto.substring(0, 1);
}

/*
 Nome da fun��o: montaCombo
 Objetivo: Utilizada para montar um combo seguindo o valor escolhido por uma outro comboBox
 Parametros:
 arrayName -> array onde cont�m a lista de itens que faram parte do combo Filho
 opt_pai -> nome do objeto Pai dentro do form
 opt_filho -> nome do objeto Filho dentro do form
 vr_padrao_pai -> Valor padr�o do campo pai
 vr_padrao_filho -> Valor padr�o do campo filho
 nm_pai -> Nome dado ao campo Pai
 nm_filho -> Nome dado ao campo Filho
 
 Exemplos:
 
 // O Array deve ser montado da seguinte maneira
 // 'IdFilho-IdPai-DsPai'
 // Separando os campos por ";" e as linhas por ","
 arrayProjeto = new Array('1-1-Teste 1' , '2-1-Teste 2', '3-2-Teste 3');
 // Nesse caso teremos um array onde o Pai de c�digo 1 ter� 2 filhos (1 e 2) e o pai de c�digo 2 ter� apenas 1 filho (3).
 
 <select name="dpdCliente" onchange="montaCombo(arrayProjeto, document.frmDados.dpdCliente, document.frmDados.dpdProjeto, '1', '3', 'cliente', 'projeto');">
 <option value="1">Teste 1</option>
 <option value="2">Teste 2</option>
 </select>
 
 <select name="dpdProjeto" onchange="montaCombo(arrayDemanda, document.frmDados.dpdProjeto, document.frmDados.dpdDemanda, '', '', 'projeto', 'demanda')">
 <option value="0">Escolha um cliente primeiro</option>
 </select>
 */
function montaCombo(arrayName, opt_pai, opt_filho, vr_padrao_pai, vr_padrao_filho, nm_pai, nm_filho)
{
    var tempArray = new Array();

    if (opt_pai.toString() == '[object]')
    {
        if (opt_pai.options.selectedIndex == 0) {
            var IdPai = "XXX";
        }
        else {
            var IdPai = opt_pai.options[opt_pai.selectedIndex].value;
        }
    }
    else
    {
        var IdPai = "";
        splPai = opt_pai.split(';');
        for (var i = 0; i < splPai.length; i++)
        {
            if (eval("" + splPai[i] + ".options.selectedIndex") == 0) {
                IdPai += "XXX";
            }
            else {
                IdPai += eval(splPai[i] + ".options[" + splPai[i] + ".selectedIndex].value");
            }
        }
    }

    var previousEnd = opt_filho.selectedIndex;

    filhoList = opt_filho.options;
    filhoList.length = 1;

    if (IdPai != 'XXX')
    {
        var n = 0;
        for (var loop = 0; loop < arrayName.length; loop++)
        {
            var linha = arrayName[loop].split(";");
            if (linha[0] == IdPai)
            {
                tempArray[loop] = linha[1] + ";" + linha[2];
            }
        }
        tempArray.sort();
        count = 1;
        for (var n in tempArray)
        {
            filhoList[count] = new Option(tempArray[count - 1]);

            valor = tempArray[count - 1].split(";")

            filhoList[count].value = valor[0];
            filhoList[count].text = valor[1];

            if (valor[0] == vr_padrao_filho)
                previousEnd = count;
            count++;
        }

        if (count == 1)
        {
            filhoList[0] = new Option("No records");
            filhoList[0].value = tempArray[""];
        }
        else
        {
            filhoList[0] = new Option("Choose the " + nm_filho);
            filhoList[0].value = tempArray[""];
        }

        if (IdPai == vr_padrao_pai)
        {
            if ((filhoList.length != 1) && (previousEnd != -1))
                filhoList.selectedIndex = previousEnd;
            else
                filhoList.selectedIndex = 0;
        }
        else
        {
            filhoList.selectedIndex = 0;
        }
    }
    else
    {
        filhoList[0] = new Option("Choose the " + nm_pai + " first");
        filhoList[0].value = tempArray[""];
        filhoList.selectedIndex = 0;
    }
}

/**
 * DHTML date validation script. Courtesy of SmartWebby.com (http://www.smartwebby.com/dhtml/)
 */
// Declaring valid date character, minimum year and maximum year
var dtCh = "/";
var minYear = 1900;
var maxYear = 2100;

function isInteger(s)
{
    var i;
    for (i = 0; i < s.length; i++)
    {
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9")))
            return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag)
{
    var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++)
    {
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1)
            returnString += c;
    }
    return returnString;
}

function daysInFebruary(year)
{
    // February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ((!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28);
}

function DaysArray(n)
{
    for (var i = 1; i <= n; i++)
    {
        this[i] = 31
        if (i == 4 || i == 6 || i == 9 || i == 11) {
            this[i] = 30
        }
        if (i == 2) {
            this[i] = 29
        }
    }
    return this
}

function isDate(dtStr)
{
    var daysInMonth = DaysArray(12)
    var pos1 = dtStr.indexOf(dtCh)
    var pos2 = dtStr.indexOf(dtCh, pos1 + 1)
    var strDay = dtStr.substring(0, pos1)
    var strMonth = dtStr.substring(pos1 + 1, pos2)
    var strYear = dtStr.substring(pos2 + 1)
    strYr = strYear

    if (strDay.charAt(0) == "0" && strDay.length > 1)
        strDay = strDay.substring(1)
    if (strMonth.charAt(0) == "0" && strMonth.length > 1)
        strMonth = strMonth.substring(1)
    for (var i = 1; i <= 3; i++)
    {
        if (strYr.charAt(0) == "0" && strYr.length > 1)
            strYr = strYr.substring(1)
    }
    month = parseInt(strMonth)
    day = parseInt(strDay)
    year = parseInt(strYr)
    if (pos1 == -1 || pos2 == -1)
    {
        alert("O formato da data precisa ser : dd/mm/aaaa")
        return false
    }
    if (strMonth.length < 1 || month < 1 || month > 12)
    {
        alert("Insira um m�s valido")
        return false
    }
    if (strDay.length < 1 || day < 1 || day > 31 || (month == 2 && day > daysInFebruary(year)) || day > daysInMonth[month])
    {
        alert("Insira um dia valido")
        return false
    }
    if (strYear.length != 4 || year == 0 || year < minYear || year > maxYear)
    {
        alert("Insira o ano com quatro digitos entre " + minYear + " e " + maxYear)
        return false
    }
    if (dtStr.indexOf(dtCh, pos2 + 1) != -1 || isInteger(stripCharsInBag(dtStr, dtCh)) == false) {
        alert("Insira uma data v�lida")
        return false
    }
    return true
}

function fMaskDate(src)
{
    if (((event.keyCode) > 47) && ((event.keyCode) < 58))
    {
        mask = '##/##/####';

        var i = src.value.length;
        var saida = mask.substring(0, 1);
        var texto = mask.substring(i);
        if (texto.substring(0, 1) != saida)
            src.value += texto.substring(0, 1);

        if (i > 9)
            return false
        else
            return(true)
    }
    else
        return(false)
}

function fMaskTime(src)
{
    if (((event.keyCode) > 47) && ((event.keyCode) < 58))
    {
        mask = '##:##';

        var i = src.value.length;
        var saida = mask.substring(0, 1);
        var texto = mask.substring(i);
        if (texto.substring(0, 1) != saida)
            src.value += texto.substring(0, 1);

        if (i > 4)
            return false
        else
            return(true)
    }
    else
        return(false)
}

function fMaskCNPJ(src)
{
    if (((event.keyCode) > 47) && ((event.keyCode) < 58))
    {
        mask = '##.###.###/####-##';

        var i = src.value.length;
        var saida = mask.substring(0, 1);
        var texto = mask.substring(i);
        if (texto.substring(0, 1) != saida)
            src.value += texto.substring(0, 1);

        if (i > 17)
            return false
        else
            return(true)
    }
    else
        return(false)
}

function fMaskCPF(src)
{
    if (((event.keyCode) > 47) && ((event.keyCode) < 58))
    {
        mask = '###.###.###-##';

        var i = src.value.length;
        var saida = mask.substring(0, 1);
        var texto = mask.substring(i);
        if (texto.substring(0, 1) != saida)
            src.value += texto.substring(0, 1);

        if (i > 13)
            return false
        else
            return(true)
    }
    else
        return(false)
}

function fMaskIE(src)
{
    if (((event.keyCode) > 47) && ((event.keyCode) < 58))
    {
        mask = '###.###.###.###';

        var i = src.value.length;
        var saida = mask.substring(0, 1);
        var texto = mask.substring(i);
        if (texto.substring(0, 1) != saida)
            src.value += texto.substring(0, 1);

        if (i > 14)
            return false
        else
            return true
    }
    else
        return(false)
}

function fMaskCEP(src)
{
    if (((event.keyCode) > 47) && ((event.keyCode) < 58))
    {
        mask = '#####-###';

        var i = src.value.length;
        var saida = mask.substring(0, 1);
        var texto = mask.substring(i);
        if (texto.substring(0, 1) != saida)
            src.value += texto.substring(0, 1);

        if (i > 8)
            return false
        else
            return(true)
    }
    else
        return(false)
}

function fMaskTime(src)
{
    if (((event.keyCode) > 47) && ((event.keyCode) < 58))
    {
        mask = '##:##';

        var i = src.value.length;
        var saida = mask.substring(0, 1);
        var texto = mask.substring(i);
        if (texto.substring(0, 1) != saida)
            src.value += texto.substring(0, 1);

        if (i > 4)
            return false
        else
            return(true)
    }
    else
        return(false)
}

function fMaskFone(src)
{
    if ((event.keyCode > 47) && (event.keyCode < 58))
    {
        mask = '(##)#####-####';

        var i = src.value.length;

        if (i == 0)
            src.value = '(';
        if (i == 3)
            src.value += ') ';
        if (i == 9)
            src.value += '-';

        if (i > 14)
            return false
        else
            return(true)
    }
    else
        return(false)
}

function fMaskNumber(src)
{
    if (((event.keyCode) > 47) && ((event.keyCode) < 58))
    {
        return(true)
    }
    else
        return(false)
}

function fMaskPlaca(src) {
    if ((((event.keyCode) > 47) && ((event.keyCode) < 58)) || ((event.keyCode) > 64 && (event.keyCode) < 91))
    {
        mask = '###-####';

        var i = src.value.length;

        if (i == 3)
            src.value += '-';

        if ((i == 0 || i == 1 || i == 2) && ((event.keyCode) < 64 || (event.keyCode) > 91))
            return false;

        if ((i == 3 || i == 4 || i == 5 || i == 6 || i == 7) && ((event.keyCode) < 47 || (event.keyCode) > 58))
            return false;

        if (i > 7)
            return false
        else
            return(true)
    }
    else
        return(false)


}


function fMaskCCusto(src)
{
    if (((event.keyCode) > 47) && ((event.keyCode) < 58))
    {
        mask = '#.###.##.##.#####.###';

        var i = src.value.length;
        var saida = mask.substring(0, 1);
        var texto = mask.substring(i);
        if (texto.substring(0, 1) != saida)
            src.value += texto.substring(0, 1);

        if (i > 21)
            return false
        else
            return(true)
    }
    else
        return(false)
}

function fMaskCCliente(src) {
    if (((event.keyCode) > 47) && ((event.keyCode) < 58)) {
        mask = '###.####';

        var i = src.value.length;
        var saida = mask.substring(0, 1);
        var texto = mask.substring(i);
        if (texto.substring(0, 1) != saida)
            src.value += texto.substring(0, 1);

        if (i > 7)
            return false
        else
            return (true)
    }
    else
        return (false)
}



/* -------------------------------------------------------------------------- */
function unformatNumber(valor) {
    if ((valor == "") || (valor == null)) {
        return "";
    }
    resposta = "";

    for (i = 0; i < valor.length; i++) {
        if ((valor.charAt(i) != "(") && (valor.charAt(i) != ")")) {
            resposta += valor.charAt(i);
        }
    }
    if (valor.charAt(0) == "(")
        resposta = "-" + resposta;
    return resposta;
}

function isNumber(s, tipo) {
    /*
     var int 	= "0123456789";
     var number 	= int + "-,";
     
     var s = unformatNumber(s);
     if (s.length == 0) return false;
     
     var c = s.charAt(0);
     if (tipo == '+') {
     if (int.indexOf(c) == -1) return false;
     } else if (tipo == '-') {
     if (c != '-') return false;
     }
     
     var i;
     for (i = 0; i < s.length; i++)
     {
     // Check that current character is number.
     var c = s.charAt(i);
     if (number.indexOf(c) == -1) {
     return false;
     }
     }
     */

    // All characters are numbers.
    return true;
}

function isNumberPositivo(s) {
    var number = "0123456789,";

    var s = unformatNumber(s);
    if (s.length == 0)
        return false;

    var i;
    for (i = 0; i < s.length; i++)
    {
        // Check that current character is number.
        var c = s.charAt(i);
        if (number.indexOf(c) == -1) {
            return false;
        }
    }
    // All characters are numbers.
    return true;
}

/*
 ----------------------------------------------------------------------------- 
 FUN��O DE FORMATA��O NUM�RICA
 ----------------------------------------------------------------------------- 
 */
var DECIMAL = ',';
var SEPARATOR = '.';

function tirarZerosEsquerda(STR)
{
    var int = '0123456789';
    var sAux = '';
    var i = 0;

    STR = new String(STR);
    while (i < STR.length)
    {
        pChar = STR.charAt(i);
        if (int.indexOf(pChar) != -1)
            sAux += STR.charAt(i);
        i++;
    }

    STR = new String(sAux);
    sAux = '';
    i = 0;

    while (i < STR.length)
    {
        if (STR.charAt(i) != '0')
        {
            sAux = STR.substring(i, STR.length)
            i = STR.length;
        }
        i++;
    }
    return  sAux;
}

function keyPressNumber(txtName)
{
    if ((txtName == "") || (txtName == null))
        return false;

    num = "1234567890-";

    if (num.indexOf(txtName) >= 0)
        return true;
    else
        return false;
}

function fMaskMoeda(campo, tammax, casas, teclapres)
{
    var tecla = teclapres.keyCode; 	// tecla digitada

    var ctrl = teclapres.ctrlKey;

   
    if ((tecla < 48 || tecla > 57) && (tecla != 8) && (tecla != 9) && (tecla != 45))
        return false; // Bloqueia a tecla DELETE

    vr = campo.value;	// Define na vari�vel "vr" o conte�do atual do campo solicitado

    // Verifica se foi a tecla digitada foi a de "-" (menos)
    if (tecla == 45)
    {
        if (vr.indexOf('-') == -1)
            campo.value = setMinus(vr);	// Define o campo com o sinal de menos
        return false; // retorna false, pois a string "-" n�o ser� inserida
    }

    iMinus = vr.indexOf('-');			// Verifica se o n�mero atual � negativo
    vr = tirarZerosEsquerda(vr);	// Limpa a string, deixando apenas os n�meros validos
    tam = vr.length;				// Seta o tamanho da string na vari�vel

    if (tecla == 8) {
        tam--;
    }			// Se foi digitada a tecla de backspace diminimos 1 (hum) ao tamanho da string atual
    if (tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105) {
        tam++;
    }			// Se foi digitada uma tecla diferente do backspace aumentamos 1 (hum) ao tamanho da string atual
    if (tam > tammax)
        return false;		// Se o tamanho da string ultrapassar o limite definido na fun��o retorna false e n�o permite a digita��o da tecla

    // Se a tecla digitada for um numero ou BACKSPACE realiza a formata��o da string
    if (tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105)
    {
        // Verifica se o n�mero de casas decimais � maior de 0 e se o tamanho da string � menor ou igual o n�mero de casas decimais
        if (casas > 0 && tam <= casas)
        {
            // Verifica se o tamanho da string � igual a quantidade de casas decimais definida
            if (tam == casas)
                sTmp = '0' + DECIMAL + vr;
            // Verifica se o tamanho da string � menor que a quantidade de casas decimais definida
            else if (tam < casas)
            {
                sTmp = '0' + DECIMAL;
                for (j = casas; j > tam; j--) 	// Realiza o Loop para inserir a quantidade de zeros ap�s o DECIMAL antes de inserir o n�mero digitado at� o momento
                    sTmp += '0';			// Insere zero
                sTmp += vr; 				// Insere o valor ap�s colocar todos os zeros necess�rios
            }
        }
        else	// Caso o tamanho da string seja maior que a quantidade de casas decimais definida
        {
            decimal = vr.substring(tam - casas, tam);	// Define o conte�do valor decimal da string

            inteiro = '';			// Vari�vel inicial do valor inteiro
            i = casas + 1;	// Ponto inicial para o Loop que insere os separadores no valor inteiro, definido pelo pr�ximo valor ap�s o conte�do decimal
            count = 0;			// Vari�vel usada para inserir o SEPARADOR no valor inteiro
            while (i <= tam)		// Realiza o Loop pelo conte�do inteiro do valor definido
            {
                // Insere o SEPARADOR ao termos um valor inteiro divisil por 3
                if (count == 3)
                {
                    inteiro = SEPARATOR + inteiro;
                    count = 0;	// Zera o valor da vari�vel usada para inserir o SEPARADOR
                }
                pChar = vr.substring(tam - i, tam - i + 1);	// Caracter atual (do loop)
                inteiro = pChar + inteiro;				// Acrescenta o caractere a vari�vel inteira
                count++;								// Aumenta 1 (um) a vari�vel count
                i++;									// Aumenta 1 (um) a vari�vel i
            }
            if (casas > 0)
                sTmp = (inteiro + DECIMAL + decimal);	// Se o n�mero de casas decimais seja maior que zero define o conteudo com o DECIMAL
            else
                sTmp = inteiro;							// Se o n�mero de casas decimais seja igual a zero o conte�do final � igual ao conte�do da vari�vel Inteiro

            if (tecla == 8)
                sTmp += ' ';	// Se a tecla digitada for o BACKSPACE inserimos um espa�o vazio ao final da string montada pois ele ser� deletado pela a��o do backspace.
        }
        if (iMinus != -1)
            sTmp = setMinus(sTmp);	// Verifica se o valor inicial era negativo, caso seja insere a formata��o para n�mero negativo
        campo.value = sTmp;							// Define o campo com a String formatada
    }

}

function setMinus(valor)
{
    if (valor.indexOf('(') == -1) // Verifica se o n�mero n�o � negativo
        return '-' + valor; // Se n�o for negativo, insere o sinal de "-" no in�cio da string
    else // Caso o n�mero j� seja negativo
        return valor.substring(1, valor.length - 1); // Retira o sinal de negativo
}

function setFormatMinus(valor)
{
    if (valor.indexOf('(') != -1 && valor.indexOf(')') == -1) // Verifica se o n�mero � negativo
        return valor.substring(0, valor.length) + ')'; // Se for negativo, insere parent�ses no in�cio e no fim da string
    else	// Caso contr�rio retorna o valor atual do campo
        return valor;
}

function refreshCampo(obj)
{
    obj.value = obj.value;
}

/*************
 Geral
 **************/

function mostraObj(id, status) {
    var obj = document.getElementById(id);
    if (obj != null) {
        obj.style.display = (status) ? 'block' : 'none';
    }
}
function changeClass(obj, status) {
    obj.className = (status) ? 'odd' : 'even';
}
function markLine(objId, status) {
    var obj = document.getElementById(objId);
    if (obj != null) {
        changeClass(obj, status);
    }
}

function abreCadastro(status) {
    mostraObj('dvAuxiliar', status);
    mostraObj('dvFundo', status);

    if (status) {
        hideDropDowns();
    } else {
        showDropDowns();
    }

}

function fmtNumero(numero, decimal) {

    var num = new NumberFormat();
    num.setInputDecimal(',');
    num.setNumber(numero); // obj.value is '1.000,00'
    num.setPlaces(decimal, true);
    num.setCurrencyValue('');
    num.setCurrency(false);
    num.setCurrencyPosition(num.LEFT_OUTSIDE);
    num.setNegativeFormat(num.PARENTHESIS);
    num.setNegativeRed(false);
    num.setSeparators(true, '.', ',');

    return num.toFormatted();
}

function fmtNumeroLimpo(numero, decimal) {

    var num = new NumberFormat();
    num.setInputDecimal(',');
    num.setNumber(numero); // obj.value is '1.000,00'
    num.setPlaces(decimal, true);
    num.setCurrencyValue('');
    num.setCurrency(false);
    num.setCurrencyPosition(num.LEFT_OUTSIDE);
    num.setNegativeFormat(num.LEFT_DASH);
    num.setNegativeRed(false);
    num.setSeparators(false, ',', ',');


    return num.toFormatted();
}

function fmtNumeroCalculo(numero, decimal) {

    var num = new NumberFormat();
    num.setInputDecimal('.');
    num.setNumber(numero); // obj.value is '1.000,00'
    num.setPlaces(decimal, true);
    num.setCurrencyValue('');
    num.setCurrency(false);
    num.setCurrencyPosition(num.LEFT_OUTSIDE);
    num.setNegativeFormat(num.PARENTHESIS);
    num.setNegativeRed(false);
    num.setSeparators(true, '.', ',');

    return num.toFormatted();
}

function ConfirmDelete() {
    if (confirm('Deseja realmente excluir este registro?'))
    {
        return true;
    } else {
        return false;
    }
}

function fecharMsg() {

    var tbl = document.getElementById('tb_msg');

    if (tbl != null) {
        tbl.style.display = 'none';
    }

}

function DesejaSair() {
    if (confirm('Deseja realmente abandonar o cadastro ?'))
    {
        return true;
    } else {
        return false;
    }
}

function validaEmail(str)
{
    var at = "@";
    var dot = ".";
    var lat = str.indexOf(at);
    var lstr = str.length;

    if (str.indexOf(at) === -1) {
        return false;
    }

    if (str.indexOf(at) === -1 || str.indexOf(at) === 0 || str.indexOf(at) === lstr) {
        return false;
    }

    if (str.indexOf(dot) === -1 || str.indexOf(dot) === 0 || str.indexOf(dot) === lstr) {
        return false;
    }

    if (str.indexOf(at, (lat + 1)) !== -1) {
        return false;
    }

    if (str.substring(lat - 1, lat) === dot || str.substring(lat + 1, lat + 2) === dot) {
        return false;
    }

    if (str.indexOf(dot, (lat + 2)) === -1) {
        return false;
    }

    if (str.indexOf(" ") !== -1) {
        return false;
    }

    return true;
}

function bloqueiaCaracter(teclapres)
{
    var tecla = teclapres.keyCode; 	// tecla digitada
    if (tecla == 45)
    {
        return false; // retorna false, pois a string "-" n�o ser� inserida
    }

}

$(function () {

    var input = $('input');

    for (var i = 0; i < input.length; i++)
    {
        if (input[i].onkeypress !== null) {
            var inputClick = input[i].onkeypress.toString();
            
            if(inputClick.indexOf('Moeda') > -1)
                $('#' + input[i].id).addClass("blockPaste");
        }
    }

    $(".blockPaste").bind('paste', function (e) {
        e.preventDefault();
    });

//não permitir aspa simple e nem aspas duplas.
    $("input").keypress(
              function () {
                  if (event.keyCode == 39 || event.keyCode == 34)
                  {
                      return false;
                  }
              });

});
