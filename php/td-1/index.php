<?php
function start_page($title): void
{
?><!DOCTYPE html>
<html lang="fr">
<head>
    <title><?php echo $title; ?></title>
</head>
<body>
<?php
    }
?>

<?php
    start_page('titre');
?>