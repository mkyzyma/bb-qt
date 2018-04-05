import QtQuick 2.9
import QtMultimedia 5.9

// @disable-check M324
Item {
    SoundEffect {
        id: wallSound
        volume: 0.8
        source: "../../sound/kick.wav"

    }
    SoundEffect {
        id: enemySound
        volume: 0.4
        source: "../../sound/wall.wav"
    }
    SoundEffect {
        id: blastSound
        volume: 0.2
        source: "../../sound/snare-1.wav"
    }

    function wall() {
        wallSound.play();
    }

    function enemy() {
        enemySound.play();
    }

    function blast() {
        blastSound.play();
    }
}
