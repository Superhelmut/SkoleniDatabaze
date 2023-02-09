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

function seznamPodkategorii($idRodicovskeKategorie, $zanoreni)
{
    global $db;

    if ($idRodicovskeKategorie == NULL)
    {
        // hledani korenove kategorie
        $dotaz = $db->prepare("SELECT * FROM kategorie WHERE parent_id IS NULL");
        $dotaz->execute();
    }
    else
    {
        // hledani podkategorie te co nam prisla jako parametr
        $dotaz = $db->prepare("SELECT * FROM kategorie WHERE parent_id = ?");
        $dotaz->execute([$idRodicovskeKategorie]);
    }
    $seznamPodkategorii = $dotaz->fetchAll();
    $seznam = []; // vysledny seznam ktery chceme vratit
    foreach ($seznamPodkategorii as $podkategorie)
    {
        $seznam[] = [
            "id" => $podkategorie["id"],
            "nazev" => str_repeat("&nbsp;&nbsp;&nbsp;", $zanoreni).$podkategorie["nazev"],
        ];

        // zjisteni podpodkategorii
        $seznamPodpodkategorii = seznamPodkategorii($podkategorie["id"], $zanoreni + 1);
        // pripojime seznam podpodkategorii k nasemu vyslednemu seznamu
        $seznam = array_merge($seznam, $seznamPodpodkategorii);
    }
    return $seznam;
}

$chyby = [];
$vyrobceId = "";
$nazev = "";
$cena = "";
$dph = "";
$skladem = "";
$popis = "";
$kategorieId = [];
$ulozeno = false;
// zpracovani ukladaciho formulare
if (array_key_exists("ulozit", $_POST))
{
    //var_dump($_POST);
    $vyrobceId = $_POST["vyrobce"];
    $nazev = $_POST["nazev"];
    $cena = $_POST["cena"];
    $dph = $_POST["dph"];
    $skladem = $_POST["skladem"];
    $popis = $_POST["popis"];
    $kategorieId = [];
    if (array_key_exists("kategorie", $_POST))
    {
        $kategorieId = $_POST["kategorie"];
    }
    //var_dump($kategorie);

    // validace
    // vyrobce
    if ($vyrobceId == "")
    {
        $chyby["vyrobce"] = "Musí být vyplněno";
    }
    // nazev
    if ($nazev == "")
    {
        $chyby["nazev"] = "Musí být vyplněno";
    }
    // cena
    if ($cena == "")
    {
        $chyby["cena"] = "Musí být vyplněno";
    }
    else if (!is_numeric($cena))
    {
        $chyby["cena"] = "Musí být číslo";
    }
    // dph
    if ($dph == "")
    {
        $chyby["dph"] = "Musí být vyplněno";
    }
    else if (!is_numeric($dph))
    {
        $chyby["dph"] = "Musí být číslo";
    }
    // skladem
    if ($skladem == "")
    {
        $chyby["skladem"] = "Musí být vyplněno";
    }
    else if (!is_numeric($skladem))
    {
        $chyby["skladem"] = "Musí být číslo";
    }
    // popis
    if ($popis == "")
    {
        $chyby["popis"] = "Musí být vyplněno";
    }
    // kategorie
    if (count($kategorieId) == 0)
    {
        $chyby["kategorie"] = "Musí být vyplněno";
    }
    //var_dump($chyby);

    // zkontrolujeme zda-li zadna chyba nenastala
	if(count($chyby) == 0)
	{
		$ulozeno = true;
	     // vlozime produkt do databaze
		 $dotaz = $db->prepare("INSERT INTO produkt SET vyrobce_id = ?, nazev = ?, cena = ?, dph = ?, skladem = ?, popis = ?");
		 $dotaz->execute([$vyrobceId, $nazev, $cena,$dph, $skladem, $popis]);
        // zjistime id ulozeneho produktu

		 $idProduktu =$db->lastInsertId();

		// vlozime zaznamy do tabulky produkt_kategorie, ktera slouzi k definici
        // v jakych kategoriich je produkt zatrizen

		foreach($kategorieId as $katId)
		{
			$dotaz = $db->prepare("INSERT INTO produkt_kategorie set product_id = ?, kategorie_id = ?");
			$dotaz->execute([$idProduktu, $katId]);
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
    <style>
        .chyba {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
	<?php if($ulozeno == false) 
	{ ?>
		<form method="post">
			<div>
				<label for="vyrobce">Výrobce</label>
				<select name="vyrobce" id="vyrobce">
					<option value="">Vyberte</option>
					<?php
					$dotaz = $db->prepare("SELECT id, nazev FROM vyrobce ORDER BY nazev");
					$dotaz->execute();
					$seznamVyrobcu = $dotaz->fetchAll();
					foreach ($seznamVyrobcu as $vyrobce)
					{
						$selected = "";
						if ($vyrobce['id'] == $vyrobceId)
						{
							$selected = "selected";
						}
						echo "<option value='{$vyrobce['id']}' $selected>{$vyrobce['nazev']}</option>";
					}
					?>
				</select>
				<?php
				if (array_key_exists("vyrobce", $chyby))
				{
					echo "<span class='chyba'>{$chyby['vyrobce']}</span>";
				}
				?>
			</div>

			<div>
				<label for="nazev">Název</label>
				<input type="text" name="nazev" id="nazev" value="<?php echo $nazev; ?>">
				<?php
				if (array_key_exists("nazev", $chyby))
				{
					echo "<span class='chyba'>{$chyby['nazev']}</span>";
				}
				?>
			</div>

			<div>
				<label for="cena">Cena</label>
				<input type="text" name="cena" id="cena" value="<?php echo $cena; ?>">
				<?php
				if (array_key_exists("cena", $chyby))
				{
					echo "<span class='chyba'>{$chyby['cena']}</span>";
				}
				?>
			</div>

			<div>
				<label for="dph">DPH</label>
				<select name="dph" id="dph">
					<option value="">Vyberte</option>
					<option value="15" <?php if ($dph == 15) echo "selected"; ?> >Snížená (15%)</option>
					<option value="21" <?php if ($dph == 21) echo "selected"; ?> >Standartní (21%)</option>
				</select>
				<?php
				if (array_key_exists("dph", $chyby))
				{
					echo "<span class='chyba'>{$chyby['dph']}</span>";
				}
				?>
			</div>

			<div>
				<label for="skladem">Skladem</label>
				<input type="text" name="skladem" id="skladem" value="<?php echo $skladem; ?>">
				<?php
				if (array_key_exists("skladem", $chyby))
				{
					echo "<span class='chyba'>{$chyby['skladem']}</span>";
				}
				?>
			</div>

			<div>
				<label for="popis">Popis</label>
				<textarea name="popis" id="popis" cols="30" rows="10"><?php echo $popis; ?></textarea>
				<?php
				if (array_key_exists("popis", $chyby))
				{
					echo "<span class='chyba'>{$chyby['popis']}</span>";
				}
				?>
			</div>

			<div>
				<label for="kategorie">Kategorie</label>
				<select name="kategorie[]" id="kategorie" multiple>
					<?php
					$seznamKategorii = seznamPodkategorii(NULL, 0);
					foreach ($seznamKategorii as $kategorie)
					{
						$selected = "";
						// zkontrolujeme zdali vypisovana kategorie je uvnitr naseho seznamu
						if (in_array($kategorie['id'], $kategorieId))
						{
							$selected = "selected";
						}
						echo "<option value='{$kategorie['id']}' $selected>{$kategorie['nazev']}</option>";
					}
					?>
				</select>
				<?php
				if (array_key_exists("kategorie", $chyby))
				{
					echo "<span class='chyba'>{$chyby['kategorie']}</span>";
				}
				?>
			</div>

			<div>
				<button name="ulozit">Uložit</button>
			</div>
		</form>
	<?php 
	} 
	else
	{
		?>
			<h1>Produkt byl uložen</h1>
		<?php
	}
	?>
	
</body>
</html>