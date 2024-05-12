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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- main-menu Start -->
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
                <div class="domain"><a href="consulter.php">Training</a></div>
                <div class="domain"><a href="consulter_stage.php">Internship</a></div>
                <div class="domain selected">Event</div>
            </div>
            <br>
            <h3>Select Event Region & Domain:</h3>
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
                $requete = "SELECT name, location, description, date, duration, agenda, details FROM event";

                // Check if region or domain is selected
                if (!empty($_POST['region']) && !empty($_POST['domain'])) {
                    $requete .= " WHERE wilaya = ? AND domain = ?";
                } elseif (!empty($_POST['region'])) {
                    $requete .= " WHERE wilaya = ?";
                } elseif (!empty($_POST['domain'])) {
                    $requete .= " WHERE domain = ?";
                }

                // Prepare statement
                $stmt = mysqli_prepare($connexion, $requete);

                // Bind parameters if region or domain is selected
                if (!empty($_POST['region']) && !empty($_POST['domain'])) {
                    mysqli_stmt_bind_param($stmt, "ss", $_POST['region'], $_POST['domain']);
                } elseif (!empty($_POST['region'])) {
                    mysqli_stmt_bind_param($stmt, "s", $_POST['region']);
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
                    while ($utilisateur = mysqli_fetch_assoc($resultat)) {
            ?>
<div class="card">
    <div class="card-body">
        <h5 class="card-title"><?php echo $utilisateur['name']; ?></h5>
        <p class="card-text"><strong>Localisation :</strong> <?php echo $utilisateur['location']; ?></p>
        <p class="card-text"><strong>Description :</strong> <?php echo $utilisateur['description']; ?></p>
        <p class="card-text"><strong>Date :</strong> <?php echo $utilisateur['date']; ?></p>
        <p class="card-text"><strong>Duration :</strong> <?php echo $utilisateur['duration']; ?> day(s)</p>
        <p class="card-text"><strong>Agenda :</strong> <?php echo $utilisateur['agenda']; ?></p>
        <p class="card-text"><strong>Details :</strong> <?php echo $utilisateur['details']; ?></p>
    </div>
</div>
            <?php
                    }
                    // Close the div tag for card-body outside the loop
                    echo '</div>';
                } else {
                    echo "<p>There's no Event in this region and domain yet! Try looking in another region or domain.</p>";
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
