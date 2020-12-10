#ifndef BACKGROUND_H
#define BACKGROUND_H

#include <QObject>
#include <QList>
#include <QVariant>

class Background : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentBackgroundPath READ currentBackgroundPath WRITE setBackground NOTIFY backgroundChanged)
    Q_PROPERTY(QList<QVariant> backgrounds READ backgrounds NOTIFY stub)

public:
    explicit Background(QObject *parent = nullptr);

    QList<QVariant> backgrounds();
    QString currentBackgroundPath();
    Q_INVOKABLE void setBackground(QString newBackgroundPath);

signals:
    void backgroundChanged();
    void stub();
};

#endif