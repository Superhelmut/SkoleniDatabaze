<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    // vytvoreni databazoveho spojeni
    $db = new PDO(
        // parametry pripojeni
        "mysql:host=localhost;dbname=kotveni;charset=utf8",
        "root", // prihlasovaci jmeno
        "", // heslo
        array(
            // v pripade sql chyby chceme aby to vyhazovalo vyjimky
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        ),
    );

    // pripravit sql dotaz
    $nazevProduktu = "pralinky";
    $dotaz = $db->prepare("SELECT nazev, cena FROM produkt WHERE nazev = ?");
    // SELECT nazev, cena FROM produkt WHERE nazev = 'McDonald\'s'
    // odeslat dotaz do databaze
    $dotaz->execute([$nazevProduktu]);

    // vycist vysledek select dotazu
    // $dotaz->fetch - vrati jednu radku ve forme pole
    // $dotaz->fetchAll - vrati vsechny radky ve forme pole
    $vysledek = $dotaz->fetchAll();
    var_dump($vysledek);

    echo "Cena prvního produktu:";
    echo $vysledek[0]["cena"];
    ?>
</body>
</html>