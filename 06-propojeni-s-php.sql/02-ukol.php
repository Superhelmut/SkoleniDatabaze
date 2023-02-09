<?php
$db = new PDO(
    // parametry pripojeni
    "mysql:host=localhost;dbname=eshop;charset=utf8",
    "root", // prihlasovaci jmeno
    "", // heslo
    array(
        // v pripade sql chyby chceme aby to vyhazovalo vyjimky
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    ),
);

$chyba = "";
$nazevProduktu = "";
$cenaProduktu = "";
if (array_key_exists("vyhledat", $_GET))
{
    $nazevProduktu = $_GET["nazevProduktu"];

    //validace
    if ($nazevProduktu == "")
    {
        $chyba = "Název produktu musí být zadán";
    }
    else
    {
        $dotaz = $db->prepare("SELECT cena FROM produkt WHERE nazev = ?");
        $dotaz->execute([$nazevProduktu]);
        $vysledek = $dotaz->fetch();
        //var_dump($vysledek);
        // fetch nam vrati false v pripade ze vysledek je prazdny
        // (produkt neexistuje), nebo nam to vrati pole
        if ($vysledek == false)
        {
            $chyba = "Produkt nebyl nalezen";
        }
        else
        {
            // produkt byl nalezen
            $cena = $vysledek["cena"];
            $cenaProduktu = "Cena produktu je: $cena Kč";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form>
        Název produktu:
        <input type="text" name="nazevProduktu" value="<?php echo $nazevProduktu ?>">
        <button name="vyhledat">Kolik stojí?</button>
    </form>
    <?php
        echo $chyba;
    ?>
    <?php
        echo $cenaProduktu;
    ?>
</body>
</html>