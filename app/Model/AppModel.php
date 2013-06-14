<?php

App::uses('Model', 'Model');

class AppModel extends Model {

    public $recursive = '0';

    public function limitDuplicates($check, $limit) {
        // $check will have value: array('promotion_code' => 'some-value')
        // $limit will have value: 1
        $existing_promo_count = $this->find('count', array(
            'conditions' => $check,
            'recursive' => -1
        ));
        return $existing_promo_count < $limit;
    }

}
