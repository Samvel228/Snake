#include "random_position.h"
#include <QRandomGenerator>
#include <QtDebug>

random_position::random_position(QObject *parent) : QObject(parent)
{

}

QVector<int> random_position::random_pos(QVector<int> x, QVector<int> y) {
    QVector<int> xy;
    QVector<int> valid_valuesX;
    QVector<int> valid_valuesY;
    int check = 1;

    for (int i = 0; i < 41; i++) {
        for (int l = 0; l < 29; l++) {
            for (int j = 0; j < x.size(); j++) {
                if (((i * 25) == x[j]) && ((l * 25) == y[j])) {
                    check = 0;
                    break;

                }
            }

            if (check) {
                valid_valuesX.push_back(i * 25);
                valid_valuesY.push_back(l *25);
            } else {
                check = 1;
            }
        }
    }

    if (valid_valuesX.size() == 0) {
        xy.push_back(-25);
        xy.push_back(-25);
    } else {
        int kj = rand() % valid_valuesX.size();
        int new_x = valid_valuesX[kj];
        int new_y = valid_valuesY[kj];

        xy.push_back(new_x);
        xy.push_back(new_y);
    }

    return xy;
}
