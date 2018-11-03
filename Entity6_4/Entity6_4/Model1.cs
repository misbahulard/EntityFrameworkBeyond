namespace Entity6_4
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    public class Model1 : DbContext
    {
        // Your context has been configured to use a 'Model1' connection string from your application's 
        // configuration file (App.config or Web.config). By default, this connection string targets the 
        // 'Entity6_4.Model1' database on your LocalDb instance. 
        // 
        // If you wish to target a different database and/or database provider, modify the 'Model1' 
        // connection string in the application configuration file.
        public Model1()
            : base("name=Model1")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Person>()
                        .HasMany(p => p.Fans)
                        .WithOptional(p => p.Hero)
                        .Map(m => m.MapKey("HeroId"));

            modelBuilder.Entity<Person>()
                        .Map<Firefighter>(m => m.Requires("Role").HasValue("f"))
                        .Map<Teacher>(m => m.Requires("Role").HasValue("t"))
                        .Map<Retired>(m => m.Requires("Role").HasValue("r"));
        }

        public DbSet<Person> People { get; set; }



        // Add a DbSet for each entity type that you want to include in your model. For more information 
        // on configuring and using a Code First model, see http://go.microsoft.com/fwlink/?LinkId=390109.

        // public virtual DbSet<MyEntity> MyEntities { get; set; }
    }

    //public class MyEntity
    //{
    //    public int Id { get; set; }
    //    public string Name { get; set; }
    //}
}