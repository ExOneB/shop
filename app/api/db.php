<?php
    function generateRandomString($length) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
    function message_success($message="", $extra_data=[]) {
        $data = [];
        $data['error'] = false;
        $data['message'] = $message;
        $data['data'] = $extra_data;
        return $data;
    }
    function message_error($message="", $extra_data=[], $code=true) {
        $data = [];
        $data['error'] = $code;
        $data['message'] = $message;
        $data['data'] = $extra_data;
        return $data;
    }
    function throw_json_error($message) {
        send_json([
                  'error' => true,
                  'message' => $message
                  ]);
    }
    function send_json($data) {
        header('Content-Type: application/json');
        echo json_encode($data);
        exit(0);
    }
    
    function send_json_message($message) {
        send_json([
                  'error' => false,
                  'message' => $message
                  ]);
    }
    require "lib/rb.php";

    R::setup( 'mysql:host=localhost;dbname=shop',
    'root', '' );

    session_start();
