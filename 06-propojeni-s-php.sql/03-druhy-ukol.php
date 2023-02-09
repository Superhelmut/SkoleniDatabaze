<!DOCTYPE html>
<html lang="cs">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
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

	$dotaz = $db->prepare("SELECT id, nazev FROM produkt");
	$dotaz->execute();
	$vysledek = $dotaz->fetchAll();
	echo "<ul>";
	foreach ($vysledek as $nazev)
	{
		echo  "<li><a href='?id={$nazev['id']}'>{$nazev['nazev']}</a></li>";
	}
	echo "</ul>";


	if(array_key_exists("id",$_GET))
	{
		$idProduktu = $_GET["id"];
		$dotaz = $db->prepare("SELECT * FROM produkt WHERE id = ?");
		$dotaz->execute([$idProduktu]);
		$produkt = $dotaz->fetch();
		echo "<h1>{$produkt['nazev']}</h1>";
		echo "<h1>{$produkt['cena']}</h1>";
		echo "<h1>{$produkt['popis']}</h1>";
		echo "<h1>{$produkt['skladem']}</h1>";



	}

        // zjistime informace o vyrobci
        $dotaz = $db->prepare("SELECT * FROM vyrobce WHERE id = ?");
        $dotaz->execute([$produkt['vyrobce_id']]);

        $vyrobce = $dotaz->fetch();
        //var_dump($vyrobce);

        echo "<h2>Výrobce: {$vyrobce['nazev']}</h2>";

		        // zjisteni seznamu kategorii
				$dotaz = $db->prepare("
				SELECT kategorie.nazev FROM kategorie
				JOIN produkt_kategorie ON produkt_kategorie.kategorie_id = kategorie.id
				WHERE produkt_kategorie.product_id = ?
			");
			$dotaz->execute([$idProduktu]);
			$seznamKategorii = $dotaz->fetchAll();

			echo "<h2>Kategorie:</h2>";
			echo "<ul>";
			foreach ($seznamKategorii as $kategorie)
			{
				echo "<li>{$kategorie['nazev']}</li>";
			}
			echo "</ul>";
	
	?>
</body>
</html>