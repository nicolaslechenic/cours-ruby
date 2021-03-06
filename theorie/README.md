# Methodes de classe et d'instance

Pour bien comprendre les méthodes de classe et les méthodes d'instances on peux se servir de l'exemple du château de sable:

![image de châteaux de sable](images/castle.jpg)

### Méthode de classe

Dans ce premier exemple, nous allons utiliser une `méthode de classe` qui nous affichera la taille des châteaux de sable que nous permet de réaliser un sceau. Cette méthode étant dépendante uniquement de la hauteur de ce sceau, aucun besoin de créer un château (instancier).

```ruby
class ChateauSable
    def self.infos
        puts "Ce château de sable sera réalisé avec un sceau de 120mm de hauteur"
    end
end

puts ChateauSable.infos

```

On applique donc la méthode `infos` sur l'objet `ChateauSable`. Ne pas oublier de préciser que notre méthode est une `méthode de classe` grâce au mot clé `self` devant `info`(`self.info`).

### Méthode d'instance

Dans ce deuxième exemple nous souhaitons créer un château de sable et obtenir des infos sur celui-ci:

```ruby
class ChateauSable
    attr_accessor :nom, :couleur

    def initialize(nom, couleur)
        @nom = nom
        @couleur = couleur
    end

    def infos
        puts "Je viens de réaliser un beau château #{@couleur} appelé #{@nom}"
    end
end

mon_chateau_rouge = ChateauSable.new('dongeon de feu', 'rouge')
puts mon_chateau_rouge.infos

```

Ici notre château de sable ressemble à ça:

![image du dongeon de feu rouge](images/instance-castle.jpg)

Les infos concernent non plus les châteaux de sables mais une instance de cet ensemble avec ses propres propriétés !

On peux appliquer toute sorte de méthodes sur notre instance, il suffit de stocker cette instance dans une variable sur laquelle on appliquera nos méthodes:

![image du dongeon de feu rouge](images/castle-instances-precision-2.png)

#### Exemple complet:

```ruby
class ChateauSable
    attr_accessor :nom, :couleur

    def initialize(nom, couleur)
        @nom = nom
        @couleur = couleur
    end

    def infos
        puts "Je viens de réaliser un beau château #{@couleur} appelé #{@nom}"
    end

    def est_rouge?
        puts @couleur == 'rouge' ? 'Oui' : 'Non'
    end
end

a = ChateauSable.new('dongeon rouge', 'rouge')
puts a.infos
puts a.est_rouge?

```