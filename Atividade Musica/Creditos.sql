/* Lógico_1: */
CREATE DATABASE testemusica;
USE testemusica;
CREATE TABLE nomeado (
    IDnomeado INT PRIMARY KEY auto_increment,
    artista VARCHAR(120),
    titulo VARCHAR(120),
    youtube VARCHAR(240),
    credito LONGTEXT,
    fk_categoria_IDcategoria INT
);
SELECT * FROM nomeado;
SELECT * FROM categoria;


INSERT INTO nomeado (youtube,credito,fk_categoria_IDcategoria)
VALUES ("https://www.youtube.com/watch?v=jjaKKAsQc34","Colton Dixon, Seth Mosley, Johan Lindbrandt, Pete Becker, Mikey Gormley,Dior and Athens Publishing,Sony Timber Publishing, Mikey Gormley Publishing Designee, Sony Music Publishing Scandinavia AB,Universal Music Publishing MGB Scandinavia AB, These Tunes Go To 11, CentricSongs",1),
("https://www.youtube.com/watch?v=SPoZ6EXwNUs","Kirk Franklin, Brandon Lake, Jonathan Jay, Hannah Shackleford, Nicole Hannel,Brandon Lake Music, Let There Be Songs, Sounds Like Home Publishing, Maverick City Publishing, Be Essential Songs, Sound Victory Publishing, Aunt Gertrude Music Publishing LLC, Capitol CMG Paragon",1),
("https://www.youtube.com/watch?v=yG-Y9bWlCw8","David Crowder, Ben Glover, Jeff Sojka, Dante Bowe, sixsteps Music, Capitol CMG Genesis, Inot Music, Ariose Music, 9T One Songs, Capitol CMG Paragon, Sojka Songs, Bethel Worship Publishing, Maverick City Publishing, Heritage Worship Music Publishing",1),
("https://www.youtube.com/watch?v=-f4MUUMWMV4","Ben Fielding, Ed Cash, Jason Ingram, Jenn Johnson, Brian Johnson, Alletrop Music, Capitol CMG Paragon, Bethel Music Publishing, So Essential Tunes, Fellow Ships Music, SHOUT! Music Publishing Australia",1),
("https://www.youtube.com/watch?v=vA83MufOCoA","Brandon Lake, Benjamin Hastings, Dante Bowe, Bethel Music Publishing, Maverick City Publishing Worldwide, Heritage Worship Publishing, Bethel Worship Publishing, Maverick City Publishing, Heritage Worship Music Publishing, SHOUT! MP Brio, Capitol CMG Paragon ngs",1),
("https://www.youtube.com/watch?v=ihrUIPfvTh8","Ethan Hulse, Katy Nichole, David Andrew Spencer, Jeff Pardo, Centricity Songs, David Spencer Songs, Be Essential Songs, EGH Music Publishing LLC, Meaux Jeaux Music, Da Bears Da Bears Da Bears Music",1),
("https://www.youtube.com/watch?v=H3lwmCDmSA8","Joel Smallbone, Luke Smallbone, Michael Pollack, Josh Kerr, Curb Word Music, WC Music Corp., Method To The Madness, Curb Dayspring Music, Warner-Tamerlane Publishing Corp., Kilns Music, Shaun Shankel Publishing Designee, Tunes Of Black River, Songs With A Pure Tone, What Key Do You Want It In Music, Shankel Songs, 716 Music",1),
("https://www.youtube.com/watch?v=WfUkEgG5rEk","Rachael Lampa, Andrew Ripp, Ethan Hulse, mamaknowsmusic, Andrew Ripp Songs, Fishbone, Ethan Hulse Music, Be Essential Songs",1),
("https://www.youtube.com/watch?v=6CmfGXOjH38","Brandon Lake, Steven Furtick, Chris Brown, Pat Barrett, Music By Elevation Worship Publishing, Be Essential Songs, Bethel Music Publishing, Maverick City Publishing Worldwide, Heritage Worship Publishing, Capitol CMG Genesis, Housefires Sounds",1),
("https://www.youtube.com/watch?v=QBAFBtZ-h_g","Bart Millard, Phil Wickham, Jason Ingram, David Leonard, Tunes Of MercyMe, Phil Wickham Music, Simply Global Songs, Sing My Songs, J Ingram Tunes, So Essential Tunes, Integrity's Alleluia! Music, Integrated Rights",1),
(null,"Brandon Lake",2),
(null,"Chris Brown",2),
(null,"Dante Bowe",2),
(null,"Kirk Franklin",2),
(null,"Phil Wickham",2),
(null,"Ben Glover",2),
(null,"Ethan Hulse",2),
(null,"Jason Ingram",2),
(null,"Jeff Pardo",2);

CREATE TABLE categoria (
    IDcategoria INT PRIMARY KEY auto_increment,
    nome_categoria VARCHAR(120),
    premiado TINYINT DEFAULT 0
);
;
 INSERT INTO categoria (nome_categoria) VALUES
 ("Song of the Year"),("Songwriter of the Year - Artist");
 
 UPDATE categoria SET premiado = 1 WHERE IDcategoria 

ALTER TABLE nomeado ADD CONSTRAINT FK_nomeado_2
    FOREIGN KEY (fk_categoria_IDcategoria)
    REFERENCES categoria (IDcategoria)
    ON DELETE CASCADE;

