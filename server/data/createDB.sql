-- Eviter tout problème lors de la création
-- Permet de finaliser la création des tables
-- si tout est bien passé c'est ok, sinon on retourne en arrière
-- => Démarrer une transaction
-- Très important pour les sites e-commerce
BEGIN;


-- Avant de créer quoi qe ce soit
-- Si les tables existent, on les vire
DROP TABLE IF EXISTS "level",
"answer",
"question",
"quiz",
"user",
"tag"

-- timepstamptz enregistre la date avec le fuseau horaire UTC
-- Quand on sélectionne cette date, postgres nous la fournit dans ma timezone
-- qui a été configuré sur le serveur, ou selon la configuration de notre connexion

CREATE TABLE IF NOT EXISTS "level" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, -- INT SERIAL PRIMARY KEY possible aussi mais plus récent !!!!!!
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_at" TIMESTAMPTZ
)

CREATE TABLE IF NOT EXISTS "answer" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "description" TEXT NOT NULL,
  "question_id" INTEGER NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
)

CREATE TABLE IF NOT EXISTS "user"(
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "email" TEXT NOT NULL,
  "password" TEXT NOT NULL,
  "first_name" TEXT NOT NULL, -- laissé en not null pour ne pas obliger
  "last_name" TEXT NOT NULL, -- l'utilisateur pour la créa
  "created_at" TIMESTAMPTZ,
  "updated_at" TIMESTAMPTZ
)

CREATE TABLE IF NOT EXISTS "quizz" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" TEXT NOT NULL,
  "description" TEXT NULL,
  "user_id" INTEGER NOT NULL REFERENCES "user" ("id"), --! Bien retenir cette forme pour l'ajout des foreign key
  "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
)

CREATE TABLE IF NOT EXISTS "question" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "question" TEXT NOT NULL,
  "anecdote" TEXT NULL, -- quand on a pas forcément qqch à ajouter
  "wiki" TEXT NULL,
  "level_id" INTEGER NOT NULL REFERENCES "level" ("id"),
  "quizz_id" INTEGER NOT NULL REFERENCES "quizz" ("id"),
--good answer
  "answer_id" INTEGER NOT NULL REFERENCES "answer" ("id"),
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
)

CREATE TABLE IF NOT EXISTS "tag" ( --ici remplace les catégories
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" 
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
)

-- Table de liaison
-- Table pivot
-- pivot table
-- prendre la table qui arrive en premier dans l'ordre alphabétique "a_has_z" ou "a_z"
CREATE TABLE IF NOT EXISTS "quizz_has_tag"(
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "quizz_id" INTEGER NOT NULL REFERENCES "quizz" ("id"),
  "tag_id" INTEGER NOT NULL REFERENCES "quizz" ("id"),
  "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ,
  UNIQUE ("quizz_id", "tag_id") --création une association, crée comme une clé
  --n'enregistre du coup ça qu'une seule fois
  --associe plusieurs quizz à plusieurs tag
)


-- A la fin de la création des tables,
-- on modifie ce qui doit être modifié
-- On ajoute la clé étrangère quand la table référncée a été créée
-- On ne provoquera pas d'erreurs.

--Là c'est pour générer les clés étrangères
ALTER TABLE "answer" ADD FOREIGN KEY ("question_id") REFERENCES "question"("id");

-- Si tout s'est bien passé dans l'analyse des tables
-- On exectue la création !

COMMIT;
