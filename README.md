# pfe.supernova
Projet de fin d'étude en license en sciences informatiques au campus Henry Christophe de l'UEH à Limonade

# Configuration et déploiement de l’application
Après avoir décompressé le dossier `pfe.supernova` du projet. À l’intérieur se trouve un serveur
d’application dans un dossier appelé `apache-tomcat` déjà configuré pour le déploiement de
l’application ainsi que le script de la base de données à l’intérieur du dossier `sygealoc`, ayant le
code source de l’application, puis dans un sous dossier appelé `db`. Ensuite, pour arriver à lancer
l’application `sygealoc` il faudra suivre trois étapes qui sont : la mise en place de la base de
données, l’installation du service du serveur d’application et le processus de déploiement de
l’application.
1. Mise en place de la base de données.
Pour mettre la base de données en place on se procure d’un serveur web puis on crée une base de
données portant le nom de `pfe.supernova`, puis on importe le fichier `sql` qui se trouve dans le
dossier `db` du dossier décompresse du projet.
’
2. Installation du service du serveur d’application.
Afin d’utilisation l’application sans un IDE, Netbeans R.C en l’occurrence, on va d’abord
installer le service du serveur d’application Tomcat
2.1 Pour les utilisateurs de windows.
Il se trouve dans le dossier `apache-tomcat` comme mentionné ci-dessus. Dedans on se
dirige dans le dossier `bin`, puis de là on lance le terminal pour lancer la commande
suivante qui permettra d’installer le service : `service.bat install`. Puis, dans le dossier
`bin` on exécute le fichier `tomcat8w.exe` pour ensuite choisir le type de démarrage du
service et le démarrer.
2.2 Pour les utilisateurs Linux rendez-vous au lien suivant et suivez les instructions :
https://www.hostinger.com/tutorials/how-to-install-tomcat-on-ubuntu/
Pfe.supernova@2020-chcuehl@2014-2019
3. Processus de déploiement.
Maintenant que le service d’Apache Tomcat est installé et démarré on pourra accéder au tableau
de bord du serveur d’application via `localhost:6060`. Avec 6060 étant le port utilisé dans la
version du serveur déjà configuré, pour la version Linux ce sera sans doute 8080. Ensuite pour
lancer `sygealoc` on devra le déployer via son fichier `sygealoc##1.0.war` qui se trouve dans le
dossier `pfe.supernova`. Depuis le tableau de bord du serveur d’application on se rend au menu
`manager` en précisant `admin` et `admin` comme nom d’utilisateur et mot de passe. Dans la
nouvelle page on se rend à la partie `WAR file to deploy` puis on charge le fichier
sygealoc##1.0.war` de l’application pour ensuite remonter vers la partie `Application` et cliquer
sur `start` pour lancer l’application.
Accès depuis un autre poste client
Pour permettre à un poste client d’accéder à l’application il faudra modifier les paramètres du
fichier ayant l'extension `conf` du serveur web en y remplaçant la phrase `Require all denied` par
`Require all granted`. Ainsi, pourra-t-on utiliser l’adresse IP de la machine serveur pour accéder
à l’application depuis n’importe quel poste client.
À noter que serveur Apache Tomcat permet de charger au maximum 50 mégaoctets pour le
déploiement mais il a été modifié pour supporter ce projet, si vous voudriez utiliser un server
existant sur votre machine il vous faudra changer la taille maximum de chargement de fichier en
suivant les étapes suivantes :
On se rend au dossier WEB-INF (webapps > manager > WEB-INF) puis on modifie le fichier
web.xml en précisant une taille en octet supérieur à celle par défaut dans les balises suivantes :
<max-file-size>157286400</max-file-size>
<max-request-size>157286400</max-request-size>
Avec 157286400 pour 150 mégaoctets comme exemple.
Pour pouvoir déployer l’application depuis un IDE, la version de Netbeans compatible est le
Netbeans Release Candidate que l’on pourra trouver à l’une des adresses en fin de page en
ajoutant le path du serveur dans l’IDE et dans le cas du Linux il faudra executer la commande
Pfe.supernova@2020-chcuehl@2014-2019
sudo chmox 777 tomcat avec tomcat étant le nom du dossier du serveur pour n’avoir aucune
erreur.
https://download.netbeans.org/netbeans/8.2/rc/bundles/netbeans-8.2-windows.exe/
https://netbeans.org/downloads/8.2/rc /
