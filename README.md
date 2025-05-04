# README

## Capture d'écran de site

- **Navbar**  
  ![alt text](image.png)

- **Homepage**  
  ![alt text](image-1.png)  
  ![alt text](image-2.png)

- **Login**  
  ![alt text](image-3.png)

- **Sign Up**  
  ![alt text](image-4.png)

- **Publier annonce**  
  ![alt text](image-5.png)

- **Mes annonces**  
  ![alt text](image-6.png)

- **Détail annonce**  
  ![alt text](image-7.png)

- **Annonces de même boutique**  
  ![alt text](image-8.png)

- **Modifier annonces**  
  ![alt text](image-9.png)

## Annexes

### Diagramme UML

- **Diagramme de cas d'utilisation**  
  ![alt text](image-10.png)

- **Diagramme de séquence**  
  ![alt text](image-11.png)

---

### Création du modèle des annonces avec scaffold

Pour générer automatiquement le modèle, le contrôleur, les vues, la migration et les routes associées à une ressource Annonce, j’ai utilisé la commande suivante dans le terminal :

```bash
rails generate scaffold Annonce titre:string description:text prix:decimal categorie:string ville:string image:string user:references
