import QtQuick 2.0
import Bacon2D 1.0

Entity {
    height: units.gu(10)
    width: units.gu(50)

    fixtures: [
        Edge {
            vertices: [
                Qt.point(0, parent.height),
                Qt.point(parent.width, parent.height)
            ]

            sensor: true

            onBeginContact: {
                if (other.parent.glassContact === true) {
                    other.parent.x = scene.width / 2;
                    other.parent.y = 0;
                    other.parent.glassContact = false;
                    score += other.parent.ballLevel;
                }
                else {
                    other.parent.doDestroy();
                }
            }
        }
    ]
}
