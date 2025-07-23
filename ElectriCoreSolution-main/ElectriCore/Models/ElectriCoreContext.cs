using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ElectriCore.Models
{
    public partial class ElectriCoreContext : DbContext
    {
        public ElectriCoreContext()
        {
        }

        public ElectriCoreContext(DbContextOptions<ElectriCoreContext> options)
            : base(options)
        {
        }
        public virtual DbSet<ChartOfAccounts> ChartOfAccounts { get; set; }
        public virtual DbSet<MenuPermissions> MenuPermissions { get; set; }
        public virtual DbSet<Menus> Menus { get; set; }
        public virtual DbSet<RolePermissions> RolePermissions { get; set; }
        public virtual DbSet<Roles> Roles { get; set; }
        public virtual DbSet<Settings> Settings { get; set; }
        public virtual DbSet<Users> Users { get; set; }
        public virtual DbSet<Leads> Leads { get; set; }
        public virtual DbSet<Country> Country { get; set; }
        public virtual DbSet<State> State { get; set; }
        public virtual DbSet<Bank> Bank { get; set; }
        public virtual DbSet<Customer> Customer { get; set; }
        public virtual DbSet<Company> Company { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseLazyLoadingProxies();
                optionsBuilder.UseSqlServer(Startup.ConnectionString);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChartOfAccounts>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(250);

                entity.Property(e => e.CreatedDateTime).HasColumnType("datetime");

                entity.Property(e => e.DeletedDateTime).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(250);

                entity.Property(e => e.ParentId).HasColumnName("ParentID");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.UpdatedDateTime).HasColumnType("datetime");

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_ChartOfAccounts_Parent");
            });

            modelBuilder.Entity<MenuPermissions>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CreatedDateTime).HasColumnType("datetime");

                entity.Property(e => e.DeletedDateTime).HasColumnType("datetime");

                entity.Property(e => e.MenuId).HasColumnName("MenuID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Ptype)
                    .HasColumnName("PType")
                    .HasMaxLength(10);

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(5);

                entity.Property(e => e.UpdatedDateTime).HasColumnType("datetime");

                entity.HasOne(d => d.Menu)
                    .WithMany(p => p.MenuPermissions)
                    .HasForeignKey(d => d.MenuId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MenuPermissions_Menus");
            });

            modelBuilder.Entity<Menus>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.AccessUrl)
                    .IsRequired()
                    .HasColumnName("AccessURL")
                    .HasMaxLength(255);

                entity.Property(e => e.CreatedDateTime).HasColumnType("datetime");

                entity.Property(e => e.Icon).HasMaxLength(255);

                entity.Property(e => e.MobileLabel).HasMaxLength(255);

                entity.Property(e => e.MobileRoute).HasMaxLength(255);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.ParentId).HasColumnName("ParentID");

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.Property(e => e.UpdatedDateTime).HasColumnType("datetime");

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_Menus_Menus");
            });

            modelBuilder.Entity<RolePermissions>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.MenuId).HasColumnName("MenuID");

                entity.Property(e => e.Permissions)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.RoleId).HasColumnName("RoleID");

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(10)
                    .HasDefaultValueSql("(N'C')");

                entity.HasOne(d => d.Menu)
                    .WithMany(p => p.RolePermissions)
                    .HasForeignKey(d => d.MenuId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RolePermissions_Menus");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.RolePermissions)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RolePermissions_Roles");
            });

            modelBuilder.Entity<Roles>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CreatedDateTime).HasColumnType("datetime");

                entity.Property(e => e.DeletedDateTime).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.UpdatedDateTime).HasColumnType("datetime");
            });

            modelBuilder.Entity<Settings>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(250);
            });

            modelBuilder.Entity<Users>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CreatedDateTime).HasColumnType("datetime");

                entity.Property(e => e.DeletedDateTime).HasColumnType("datetime");

                entity.Property(e => e.EmailAddress)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.ProfileImage).HasMaxLength(500);

                entity.Property(e => e.RoleId).HasColumnName("RoleID");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.Property(e => e.UpdatedDateTime).HasColumnType("datetime");

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Users_Roles");
            });

            //modelBuilder.Entity<Leads>(entity =>
            //{
            //    entity.Property(e => e.Id).HasColumnName("ID");

            //    entity.Property(e => e.CreatedDateTime).HasColumnType("datetime");

            //    entity.Property(e => e.OpeningBalance).HasColumnType("decimal(18, 2)");

            //    entity.Property(e => e.AccountNo).HasColumnName("AccountNo");

            //    entity.Property(e => e.ChartOfAccountId).HasColumnName("ChartOfAccountId");

            //    entity.Property(e => e.Description).HasColumnName("Description");

            //    entity.Property(e => e.Type).IsRequired().HasMaxLength(20);

            //    entity.Property(e => e.UpdatedDateTime).HasColumnType("datetime");

            //    entity.Property(e => e.IsDeleted).IsRequired().HasColumnName("IsDeleted");
            //});

            //modelBuilder.Entity<Country>(entity =>
            //{
            //    entity.Property(e => e.Id).HasColumnName("ID");

            //    entity.Property(e => e.CreatedDateTime).HasColumnType("datetime");

            //    entity.Property(e => e.).HasColumnName("Name");

            //    entity.Property(e => e.UpdatedDateTime).HasColumnType("datetime");

            //    entity.Property(e => e.IsDeleted).IsRequired().HasColumnName("IsDeleted");
            //});

            //modelBuilder.Entity<State>(entity =>
            //{
            //    entity.Property(e => e.Id).HasColumnName("ID");

            //    entity.Property(e => e.CreatedDateTime).HasColumnType("datetime");

            //    entity.Property(e => e.ExpenseTypeId).HasColumnName("ExpenseTypeId");

            //    entity.Property(e => e.AccountOpeningId).HasColumnName("AccountOpeningId");

            //    entity.Property(e => e.Description).HasColumnName("Description");

            //    entity.Property(e => e.Amount).HasColumnName("Amount");

            //    entity.Property(e => e.UpdatedDateTime).HasColumnType("datetime");

            //    entity.Property(e => e.Date).HasColumnType("datetime");

            //    entity.Property(e => e.IsDeleted).IsRequired().HasColumnName("IsDeleted");
            //});

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
