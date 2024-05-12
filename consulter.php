<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>consulter</title>
    <link rel="stylesheet" href="consult.css">
<!--font-family-->
<link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet" />

<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet" />

<!-- TITLE OF SITE -->
<title>educonnect</title>

<!-- favicon img -->
<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>

<!--font-awesome.min.css-->
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/stylo.css" />


<!--animate.css-->
<link rel="stylesheet" href="assets/css/animate.css" />

<!--hover.css-->
<link rel="stylesheet" href="assets/css/hover-min.css">

<!--datepicker.css-->
<link rel="stylesheet"  href="assets/css/datepicker.css" >

<!--owl.carousel.css-->
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/owl.theme.default.min.css"/>

<!-- range css-->
<link rel="stylesheet" href="assets/css/jquery-ui.min.css" />

<!--bootstrap.min.css-->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />

<!-- bootsnav -->
<link rel="stylesheet" href="assets/css/bootsnav.css"/>

<!--style.css-->
<link rel="stylesheet" href="assets/css/style.css" />

<!--responsive.css-->
<link rel="stylesheet" href="assets/css/responsive.css" />

</head>

<body>


<header class="top-area">
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <div class="logo">
                        <a href="index.html">
                        <img src="logo_white.png" alt="Logo" class="logo">
                        </a>
                    </div><!-- /.logo-->
                </div><!-- /.col-->
                <div class="col-sm-10">
                    <div class="main-menu">
                    
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <i class="fa fa-bars"></i>
                            </button><!-- / button-->
                        </div><!-- /.navbar-header-->
                        <div class="collapse navbar-collapse">		  
                            <ul class="nav navbar-nav navbar-right">
                                <li class="smooth-menu"><a href="index.html">Home</a></li>
                                <li class="smooth-menu"><a href="index.html">About</a></li>
                                <li class="smooth-menu"><a href="#Contact">Contact</a></li>
                                <li>
                                    <button class="book-btn"><a href="#">Our Service</a>
                                    </button>
                                </li><!--/.project-btn--> 
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.main-menu-->
                </div><!-- /.col-->
            </div><!-- /.row -->
        </div><!-- /.container-->
    </div><!-- /.header-area -->

</header><!-- /.top-area-->
<br><br><br>
    <br>
    <br>
    <br>
<div class="our_services">
    <div class="container">
        <fieldset>
            <legend>Find your interest:</legend>
            <div class="main-domains">
                <div class="domain selected">Training</div>
                <div class="domain"><a href="consulter_stage.php">Internship</a></div>
                <div class="domain"><a href="consulter_event.php">Event</a></div>
            </div>
            <br>
            <h3>Select Training Region & Domain:</h3>
            <br>
            <form action="" method="post">
                <div class="region-selection">
                    <select name="region" id="region">
                        <option value="">All Regions in Algeria</option>
                        <option value="Alger">Alger</option>
                        <option value="Blida">Blida</option>
                        <option value="Médéa">Médéa</option>
                    </select>
                    <select name="domain" id="domain">
                        <option value="">All Domains</option>
                        <option value="language">Language</option>
                        <option value="e-commerce">E-commerce</option>
                        <option value="soft skills">Soft Skills</option>
                        <option value="marketing">Marketing</option>
                        <option value="computer science">Computer Science</option>
                        <option value="physics">Physics</option>
                        <option value="design">Design</option>
                        <option value="biology">Biology</option>
                    </select>
                    <input type="submit" class="submit-button" value="Submit">
                </div>
            </form>
            <?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

                $serveur = "localhost";
                $utilisateur_bdd = "root";
                $mot_de_passe_bdd = "";
                $nom_bdd = "edu";
   
                // Connexion à la base de données
    $connexion = mysqli_connect($serveur, $utilisateur_bdd, $mot_de_passe_bdd, $nom_bdd);

    // Vérifier la connexion
    if (!$connexion) {
        die("Échec de la connexion à la base de données : " . mysqli_connect_error());
    }

    // Prepare the SQL statement with placeholders
    $requete = "SELECT * FROM training";

    // Check if wilaya (region) or domain is selected
    if (!empty($_POST['wilaya']) && !empty($_POST['domain'])) {
        $requete .= " WHERE wilaya = ? AND domain = ?";
    } elseif (!empty($_POST['wilaya'])) {
        $requete .= " WHERE wilaya = ?";
    } elseif (!empty($_POST['domain'])) {
        $requete .= " WHERE domain = ?";
    }

    // Prepare statement
    $stmt = mysqli_prepare($connexion, $requete);

    // Bind parameters if region or domain is selected
    if (!empty($_POST['wilaya']) && !empty($_POST['domain'])) {
        mysqli_stmt_bind_param($stmt, "ss", $_POST['wilaya'], $_POST['domain']);
    } elseif (!empty($_POST['wilaya'])) {
        mysqli_stmt_bind_param($stmt, "s", $_POST['wilaya']);
    } elseif (!empty($_POST['domain'])) {
        mysqli_stmt_bind_param($stmt, "s", $_POST['domain']);
    }

    // Execute query
    mysqli_stmt_execute($stmt);

    // Get result
    $resultat = mysqli_stmt_get_result($stmt);

    // Check if there are rows in the result
    if (mysqli_num_rows($resultat) > 0) {
        // Fetch rows as an associative array
        while ($training = mysqli_fetch_assoc($resultat)) {
            ?>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><?php echo $training['name']; ?></h5>
                    <p class="card-text"><strong>Location :</strong> <?php echo $training['location']; ?></p>
                    <p class="card-text"><strong>Description :</strong> <?php echo $training['description']; ?></p>
                    <p class="card-text"><strong>Company Name :</strong> <?php echo $training['company_name']; ?></p>
                    <p class="card-text"><strong>Company Description :</strong> <?php echo $training['company_description']; ?></p>
                    <p class="card-text"><strong>Duration :</strong> <?php echo $training['duration']; ?> hour(s)</p>
                    <p class="card-text"><strong>Date :</strong> <?php echo $training['date']; ?></p>
                    <p class="card-text"><strong>Price :</strong> <?php echo $training['price']; ?> DA</p>
                    <p class="card-text"><strong>Coach Name :</strong> <?php echo $training['teacher_name']; ?></p>
                    <p class="card-text"><strong>Background :</strong> <?php echo $training['teacher_description']; ?></p>
                </div>
            </div>
            <?php
        }
    } else {
        echo "There's no training in this region or domain";
    }
}
?>
        </fieldset>
    </div>
</div>
    <br><br><br>
</body>
		<!-- footer-copyright start -->
		<footer  class="footer-copyright">
			<div class="container">
				<div class="footer-content">
					<div class="row">

						<div class="col-sm-3">
							<div class="single-footer-item">
								<div class="footer-logo">
									<a href="index.html">
                                    <img src="logo_full.png" alt="logo" class="logo_full">
                                </a>
									<p>
										
									</p>
								</div>
							</div><!--/.single-footer-item-->
						</div><!--/.col-->

						<div class="col-sm-3">
							<div class="single-footer-item">
								<h2>link</h2>
								<div class="single-footer-txt">
									<p><a href="#">home</a></p>
									<p><a href="#">about</a></p>
									<p><a href="#">teacher</a></p>
									<p><a href="#">course</a></p>
									<p><a href="#">review</a></p>
									<p><a href="#">contacts</a></p>
								</div><!--/.single-footer-txt-->
							</div><!--/.single-footer-item-->

						</div><!--/.col-->
                        <div class="col-sm-3">
							<div class="single-footer-item">
								<h2>popular courses</h2>
								<div class="single-footer-txt">
									<p><a href="#">web Development</a></p>
									<p><a href="#">AI</a></p>
									<p><a href="#">UI/UX design</a></p>
									<p><a href="#">french</a></p>
									<p><a href="#">english</a></p>
								</div><!--/.single-footer-txt-->
							</div><!--/.single-footer-item-->
						</div><!--/.col-->


						<div class="col-sm-3" id="Contact">
							<div class="single-footer-item text-center">
								<h2 class="text-left">contacts</h2>
								<div class="single-footer-txt text-left">
									<p>+213 541 39 48 72</p>
									<p class="foot-email"><a href="#">educonnect@gmail.com</a></p>
									<p>34 rue La Fontaine, Beb Sebt</p>
									<p>Blida, Algérie</p>
								</div><!--/.single-footer-txt-->
							</div><!--/.single-footer-item-->
						</div><!--/.col-->

					</div><!--/.row-->

				</div><!--/.footer-content-->
				<hr>
				<div class="foot-icons ">
					<ul class="footer-social-links list-inline list-unstyled">
		                <li><a href="#" target="_blank" class="foot-icon-bg-1"><i class="fa fa-facebook"></i></a></li>
		                <li><a href="#" target="_blank" class="foot-icon-bg-2"><i class="fa fa-twitter"></i></a></li>
		                <li><a href="#" target="_blank" class="foot-icon-bg-3"><i class="fa fa-instagram"></i></a></li>
		        	</ul>
		        </div><!--/.foot-icons-->
				<div id="scroll-Top">
					<i class="fa fa-angle-double-up return-to-top" id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
				</div><!--/.scroll-Top-->
			</div><!-- /.container-->

		</footer><!-- /.footer-copyright-->
		<!-- footer-copyright end -->

</html>
