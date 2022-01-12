using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace greenTea.Models
{
    public class Contexto : DbContext
    {
        public DbSet<CardTable> CardTables { get; set; }
        public DbSet<Categoria> Categorias { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(connectionString: @"Server=workstation id=greenTea.mssql.somee.com;packet size=4096;user id=vavah_SQLLogin_1;pwd=lwz8mnku8n;data source=greenTea.mssql.somee.com;persist security info=False;initial catalog=greenTea");
        }
    }
}
