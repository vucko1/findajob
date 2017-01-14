<?php

function connect() {
    return mysqli_connect(getenv('MYSQL_SERVICE_HOST'), getenv('MYSQL_USER'), getenv('MYSQL_PASSWORD'), getenv('MYSQL_DATABASE'));
}

?>