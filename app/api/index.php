<?php
    require_once __DIR__ ."/db.php";
    require_once __DIR__ ."/lib.php";
    
    $request = $_REQUEST;
    
    
    header("Access-Control-Allow-Origin: *");
    error_reporting(E_ALL); //выводим все ошбики
    ini_set('display_errors', true);

    if (!isset($request['func'])) {
        throw_json_error('Не передан параметр func');
    }
    
    $func = $request['func'];
    
    //api проверки авторизации
    if ('app_api_auth' === $func) {
        $res = $func([], $request);
        if ($res['error']) {
            throw_json_error($res['message']);
        }
        send_json($res);
    }
    
    if ('app_api_add' === $func) {
        $res = $func([], $request);
        if ($res['error']) {
            throw_json_error($res['message']);
        }
        send_json($res);
    }
    
    if ('app_api_contacts' === $func) {
        $res = $func([], $request);
        if ($res['error']) {
            throw_json_error($res['message']);
        }
        send_json($res);
    }
    
    if ('app_api_photo' === $func) {
        $res = $func([], $request);
        if ($res['error']) {
            throw_json_error($res['message']);
        }
        send_json($res);
    }

    if (in_array($func, $functions)) {
        $res = $func($user, $request);
        $res['message'] = T($res['message']);
        send_json($res);
    }
    throw_json_error("Метод не найден");
    
