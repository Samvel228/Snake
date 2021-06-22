#ifndef RANDOM_POSITION_H
#define RANDOM_POSITION_H

#include <QVector>
#include <QObject>

class random_position : public QObject
{
    Q_OBJECT
public:
    explicit random_position(QObject *parent = nullptr);

signals:
public slots:
    QVector<int> random_pos(QVector<int> x, QVector<int> y);

};

#endif // RANDOM_POSITION_H
