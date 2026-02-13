-- seed.sql
USE prodavnica;

-- -----------------------------
-- KORISNICI
-- -----------------------------
INSERT INTO users (username, email, password) VALUES
('budo budović', 'budo@gmail.com', 'pluzine'),
('mišo mišović', 'miso@gmail.com', 'podgorica');

-- -----------------------------
-- PROIZVODI
-- -----------------------------
INSERT INTO products (name, description, price, image_url) VALUES
('klub-sto jedan', 'puno drvo, odlično očuvan', 30.00, '/storage/pictures/klub-sto-1.jpg'),
('klub-sto dva', 'puno drvo sa staklom na površini, kao nov', 25.00, '/storage/pictures/klub-sto-2.jpg'),
('video-plejer retro', 'za retro kolekcije, ljubitelje starije tehnologije', 20.00, '/storage/pictures/video-plejer-retro.jpg');

-- -----------------------------
-- LOGOVI (opcionalno)
-- -----------------------------
-- Ovo su prvi primjeri logova
INSERT INTO logs (user_id, action_type, entity, entity_id, description) VALUES
(1, 'CREATE_PRODUCT', 'product', 1, 'Budo je dodao proizvod klub-sto jedan'),
(1, 'CREATE_PRODUCT', 'product', 2, 'Budo je dodao proizvod klub-sto dva'),
(2, 'CREATE_PRODUCT', 'product', 3, 'Mišo je dodao proizvod video-plejer retro');
