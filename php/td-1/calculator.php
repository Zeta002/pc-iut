<?php require 'functions.php'; ?>

<?php
    start_page('calculator', '');

    $operateurs = '*+-/';
?>
    <form action="calc.php" method="post">
        <label for="op1">Number 1:</label>
        <input type="number" name="op1"><br>
        <label for="op2">Number 2:</label>
        <input type="number" name="op2"><br>

        <select name="operateurs">
            <option value="*">Multiplication</option>
            <option value="+">Addition</option>
            <option value="-">Soustraction</option>
            <option value="/">Division</option>
        </select>
        <input type="submit"/>
    </form>
<?php
    end_page();
?>