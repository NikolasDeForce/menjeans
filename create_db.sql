DROP DATABASE IF EXISTS jeans_rest;
CREATE DATABASE jeans_rest;

\c jeans_rest;

CREATE TABLE menjeans (
    id SERIAL PRIMARY KEY,
    nameru VARCHAR NOT NULL,
    nameeng VARCHAR NOT NULL,
    discription VARCHAR NOT NULL,
    urls VARCHAR NOT NULL
);

INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Джинсы с высокой посадкой', 'Hight rise jeans', 'Верх пояса джинсов на уровне или выше пупка. Расстояние от пояса до шагового шва 25 см и более. У многих брендов нет мужских джинсов с высокой посадкой. В настоящее время редкий вариант.', 'https://images.asos-media.com/products/sinie-vintazhnye-dzhinsy-s-zavyshennoj-taliej-asos-design/10839108-1-midwashvintage?$n_1920w$&wid=1926&fit=constrain');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Джинсы с средней посадкой', 'Mid rise jeans', 'Верх пояса джинсов немного ниже пупка - примерно на 1-3 см. Расстояние от пояса до шагового шва от 20 до 24 см. Средняя посадка примерно соответствует уровню талии.', 'https://men-mag.com/wp-content/uploads/2023/03/mid-rise-balenciaga.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Джинсы с низкой посадкой', 'Low rise jeans', 'Верх пояса джинсов примерно на 5 см ниже пупка. Расстояние от пояса до шагового шва до 20 см. Низкая посадка примерно чуть ниже уровня талии. Низкая посадка джинсов является самой распространенной. Часто называется просто below waist - "ниже талии".', 'https://men-mag.com/wp-content/uploads/2023/03/low-rise-boss.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Джинсы с низким шаговым швом', 'Low crotch jeans', 'Верх пояса джинсов примерно на 5 см ниже пупка - как у низкой посадки, но шаговый шов значительно ниже стандартных джинсов.', 'https://men-mag.com/wp-content/uploads/2023/03/low-crotch-benetton.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Джинсы клеш', 'Flared jeans, Bell bottom', 'Нижняя часть штанины значительно расширяется к низу. Если степень расширения штанины не значительная, то такие расклешенные джинсы у многих брендов считаются bootcut.', 'https://men-mag.com/wp-content/uploads/2023/03/flared-cut.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Джинсы под ботинки', 'Bootcut jeans', 'Нижняя часть штанин джинсов от колена слегка расширяется к низу. Такие джинсы, даже с высокими и массивными ботинками, не будут их обтягивать.', 'https://men-mag.com/wp-content/uploads/2023/03/boot-cut.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Джинсы с прямой штаниной', 'Straight cut jeans', 'Это джинсы с прямой штаниной от колена до нижнего края штаниныю', 'https://men-mag.com/wp-content/uploads/2023/03/straight-cut.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Джинсы с полузауженной штаниной', 'Semi tappered leg jeans', 'Это достаточное условное выделение джинсов со штанинами некой средней зауженности. Сам tapered cut может быть с различной степенью сужения.', 'https://men-mag.com/wp-content/uploads/2023/03/semi-taperd-cut.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Джинсы с зауженной штаниной', 'Tappered leg jeans', 'Джинсы с различной степенью сужения штанины от колена до низа. Насколько сильно заужена штанина книзу, зависит от бренда и модели.', 'https://men-mag.com/wp-content/uploads/2023/03/tapered-cut.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Джинсы свободного кроя прямые', 'Loose fit jeans', 'Loose fit - это свободные джинсы. Могут быть прямыми - straight loose fit или сужающимися - tapered loose fit. У некоторых брендов называются Relaxed fit jeans.', 'https://men-mag.com/wp-content/uploads/2023/03/loose-fit-straight.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Свободные джинсы, сужающиеся книзу', 'Loose fit tappered jeans', 'Джинсы свободного кроя, сужающиеся от самого верха книзу штанины.', 'https://men-mag.com/wp-content/uploads/2023/03/loose-fit-tapered.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Прямые джинсы', 'Straight fit jeans', 'Прямые джинсы могут иметь разную степень прилегания - свободные прямые, классические прямые, узкие прямые и т.д.', 'https://men-mag.com/wp-content/uploads/2023/03/straight-fit.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Сужающиеся книзу джинсы', 'Tappered fit jeans', 'Tapered fit jeans - джинсы с постепенным сужением к низу по всей штанине, повторяющие естественный силуэт. Могут быть и свободного кроя - Relaxed tapered fit, и прилегающего, например Slim tapered fit.', 'https://men-mag.com/wp-content/uploads/2023/03/tapered-fit.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Узкие джинсы', 'Slim fit jeans', 'Джинсы слим фит - прилегают в области бедер. Могут быть прямыми - Straight slim fit, или сужающимися Tapered slim fit.', 'https://men-mag.com/wp-content/uploads/2023/03/slim-fit.png');
INSERT INTO menjeans(nameru, nameeng, discription, urls) VALUES ('Скинни джинсы', 'Skinny fit jeans', 'Скинни джинсы просто полностью облегают бедра и ноги. Это самый узкий крой джинсов.', 'https://men-mag.com/wp-content/uploads/2023/03/skinny-fit.png');