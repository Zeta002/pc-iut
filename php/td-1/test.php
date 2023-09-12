<?php require 'functions.php'; ?>

<?php
    start_page('Test', 'Salut ceci est ma page');

    $jour = date('d/m/Y', strtotime('2020-04-01'));
    echo $jour;

    end_page();
