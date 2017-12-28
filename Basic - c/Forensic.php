<?php

class Forensic
{
    public $suspects = [
        'John Novak' => [
            'Hair' => 'Black',
            'Eyes' => 'Green',
            'Race' => 'Asian'
        ],
        'Vin Diesel' => [
            'Hair' => 'Blonde',
            'Eyes' => 'Brown',
            'Race' => 'Caucasian'
        ],
        'Guy Fawkes' => [
            'Hair' => 'Black',
            'Eyes' => 'Brown',
            'Race' => 'Hispanic'
        ]
    ];

    public $legend = [
        'Eyes' => [
            'Black' => '140L98',
            'Green' => '140A98',
            'Brown' => '140A88',
            'Blue' => '140L97',
        ],
        'Hair' => [
            'Brown' => 'HHHKLJ',
            'Black' => 'HHHKLI',
            'Blonde' => 'HHLH1L',
            'White' => 'HHLH2L'
        ],
        'Race' => [
            'Asian' => '1HYYYN',
            'Hispanic' => 'IHYYYN',
            'White' => 'IHYYNN'
        ]
    ];

    public $suspectDNKs = [];
    public $murderer = '';
    
    public function findMurderer(string $dnk)
    {
        foreach($this->suspects as $suspect => $characteristics) {
            $this->suspectDNKs[$suspect] = '';
            
            foreach($characteristics as $characteristic => $value) {
                $this->suspectDNKs[$suspect] .= $this->getCharacteristicValue($characteristic, $value);
            }
        }


        foreach($this->suspectDNKs as $key => $value) {
            if($value == $dnk) {
                $this->murderer = $key;
            }
        }

        return strlen($this->murderer) ? "The murderer is $this->murderer.<br>" : "Nobody did it :O.<br>";
    }

    public function getCharacteristicValue(string $characteristic, string $value)
    {
        foreach($this->legend[$characteristic] as $key => $c) {
            if($key == $value) {
                return $c;
            }
        }
    }
}

$forensic = new Forensic();
echo $forensic->findMurderer('HHHKLJ140L98IHYYYN'); // Nobody did it
echo $forensic->findMurderer('HHHKLI140A981HYYYN'); // John Novak is the murderer
// echo $forensic->findMurderer('HHLH1L140A88'); No Caucasian value for Vin Diesel
echo $forensic->findMurderer('HHHKLI140A88IHYYYN'); // Guy Fawkes is the murderer