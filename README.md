# README

## Capture d'écran de site

- **Navbar**  
  ![image](https://github.com/user-attachments/assets/7e95eba4-3c35-42fb-a4f8-071952be92ba)


- **Homepage**  
  ![image](https://github.com/user-attachments/assets/20069400-56df-44f3-9a15-5f3c9cc9218b)

![image](https://github.com/user-attachments/assets/087d1049-a1b8-491b-b67f-36e19c96a3db)


- **Login**  
 ![image](https://github.com/user-attachments/assets/86b38a7a-7639-49c4-9adc-609971c0a668)


- **Sign Up**  
 ![image](https://github.com/user-attachments/assets/24fe4683-4bd4-401a-a5f8-8b2b0a86bc1c)


- **Publier annonce**  
 ![image](https://github.com/user-attachments/assets/51870f2e-2b5f-4bbe-a378-4a7edf1cae6e)


- **Mes annonces**  
  ![image](https://github.com/user-attachments/assets/f534f8fa-e204-4352-a706-0462282a7031)


- **Détail annonce**  
![image](https://github.com/user-attachments/assets/2865879f-5873-4440-8e87-d2357768ac5b)


- **Annonces de même boutique**  
 ![image](https://github.com/user-attachments/assets/b407b015-1908-494e-9e43-87c77b32616b)


- **Modifier annonces**  
![image](https://github.com/user-attachments/assets/f4c43ec9-c8fa-4f84-9816-d1c987ae152e)


## Annexes

### Diagramme UML

- **Diagramme de cas d'utilisation**  
![image](https://github.com/user-attachments/assets/df2feba9-3262-4edd-acfb-bbffd4424284)


- **Diagramme de séquence**  
  ![image](https://github.com/user-attachments/assets/3c1f0f84-9b4c-4b85-97f6-286988d70a9c)


---

### Création du modèle des annonces avec scaffold

Pour générer automatiquement le modèle, le contrôleur, les vues, la migration et les routes associées à une ressource Annonce, j’ai utilisé la commande suivante dans le terminal :

```bash
rails generate scaffold Annonce titre:string description:text prix:decimal categorie:string ville:string image:string user:references
