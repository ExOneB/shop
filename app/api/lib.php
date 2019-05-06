<?php

//авторизация
function app_api_auth($user, $request)
{
    if (!isset($request['login'])) {
        return message_error('Отсутствует логин');
    }
    if (!isset($request['password'])) {
        return message_error('Отсутствует пароль');
    }

    $user = R::findOne('users', 'login = ?', array($request['login']));
    if (!$user) {
        return message_error('пользователь не найден!');
    }

    if (password_verify($request['password'], $user->password)) {
        $token = generateRandomString(200);

        $users = R::dispense('webauth');
        $users->user_id = $user['id'];
        $users->code = $token;
        R::store($users);

        return message_success('Вы авторизованы!', $token);
    } else {
        return message_error('Не верный пароль!');
    }

}

function app_api_add($user, $request)
{

    if (!isset($request['phone'])) {
        return message_error('Отсутствует телефон');
    }
    if (!isset($request['adres'])) {
        return message_error('Отсутствует адрес');
    }
    if (!isset($request['email'])) {
        return message_error('Отсутствует email');
    }
    if (!isset($request['time'])) {
        return message_error('Отсутствует время');
    }

    $protocol = strtolower(substr($_SERVER["SERVER_PROTOCOL"], 0, strpos($_SERVER["SERVER_PROTOCOL"], '/'))) . '://';
    if ($_FILES['File']) {
        $path = '/img/';
        $exts = explode('.', $_FILES['File']['name']);
        $ext = strtolower(array_pop($exts));
        $new_name = $protocol . $_SERVER['SERVER_NAME'] . '/app' . $path . time() . '.' . $ext;
        $full_path = dirname(__DIR__) . $path . time() . '.' . $ext;
        if ($_FILES['File']['error'] == 0) {
            if (move_uploaded_file($_FILES['File']['tmp_name'], $full_path)) {
                $shop = R::dispense('shop');
                $shop->email = $request['email'];
                $shop->adres = $request['adres'];
                $shop->img = $new_name;
                R::store($shop);

                $shop_id = R::findOne('shop', 'adres = ?', array($request['adres']));
                $phones = json_decode($request['phone'], true);
                $times = json_decode($request['time'], true);

                foreach ($phones as $item) {
                    $phone = R::dispense('phone');
                    $phone->id_shop = $shop_id['id'];
                    $phone->phone = $item['value'];
                    R::store($phone);
                }
                foreach ($times as $item) {
                    $time = R::dispense('time');
                    $time->id_shop = $shop_id['id'];
                    $time->time = $item['value'];
                    R::store($time);
                }
            } else {
                return message_error("Добавьте фото магазина!");
            }
        } else {
            return message_error("Добавьте фото магазина!");
        }
    } else {
        return message_error("Добавьте фото магазина!");
    }

    return message_success('Успех!');
}

function app_api_contacts($user, $request)
{
    $shop = R::findAll('shop');
    $datas = array();
    foreach ($shop as $item) {
        $phones = R::find('phone', 'id_shop = ?', array($item['id']));
        $times = R::find('time', 'id_shop = ?', array($item['id']));
        $images = R::find('image', 'id_shop = ?', array($item['id']));

        $url = 'http://geocode-maps.yandex.ru/1.x/?geocode='.urlencode($item['adres']).'&key=d5387537-ae67-4461-b849-6a81ac3a14a6==';

        $results = file($url);

        if($results && is_array($results) && count($results)) {
            $data=implode("", $results);

            if(preg_match("#<pos>([0-9\.]*) ([0-9\.]*)</pos>#i", $data, $out)) {

                $lng=floatval(trim($out[1]));
                $lat=floatval(trim($out[2]));
                $datas[] = [
                    'id' => $item['id'],
                    'adres' => $item['adres'],
                    'email' => $item['email'],
                    'img' => $item['img'],
                    'phonesArr' => $phones,
                    'timesArr' => $times,
                    'imagesArr' => $images,
                    'lat' => $lat,
                    'long' => $lng,
                ];
            }

        }
    };

    return message_success('Успех!', $datas);
}

function app_api_photo($user, $request)
{
    $protocol = strtolower(substr($_SERVER["SERVER_PROTOCOL"], 0, strpos($_SERVER["SERVER_PROTOCOL"], '/'))) . '://';
    if ($_FILES['File']) {
        $path = '/img/';
        $exts = explode('.', $_FILES['File']['name']);
        $ext = strtolower(array_pop($exts));
        $new_name = $protocol . $_SERVER['SERVER_NAME'] . '/app' . $path . time() . '.' . $ext;
        $full_path = dirname(__DIR__) . $path . time() . '.' . $ext;
        if ($_FILES['File']['error'] == 0) {
            if (move_uploaded_file($_FILES['File']['tmp_name'], $full_path)) {

                $image = R::dispense('image');
                $image->id_shop = $request['id'];
                $image->img = $new_name;
                R::store($image);

            } else {
                return message_error("Добавьте фото магазина!");
            }
        } else {
            return message_error("Добавьте фото магазина!");
        }
    } else {
        return message_error("Добавьте фото магазина!");
    }


    return message_success('Успех!');
}


