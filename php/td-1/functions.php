<?php
    function start_page($title, ?string $content): void
    {
    ?><!DOCTYPE html>
    <html lang="fr">
    <head>
        <title><?php echo $title; ?></title>
    </head>
    <body>
        <br><strong><?php echo $content ?></strong><br>
    <?php } ?>

    <?php
    function end_page(): void
    { ?>
    <body>
    <html>
    <?php }?>



