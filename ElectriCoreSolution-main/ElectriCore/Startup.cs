using ElectriCore.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json.Serialization;
using Microsoft.AspNetCore.Mvc;

namespace ElectriCore
{
    public class Startup
    {
        public static string ConnectionString { get; set; }
        public static IWebHostEnvironment CurrentHostingEnvironment { get; set; }
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddRouting(options => options.LowercaseUrls = true);
            services.AddSession(options =>
            {
                // Set a short timeout for easy testing.
                options.IdleTimeout = TimeSpan.FromHours(10);
            });
            services.AddControllersWithViews();
            services.AddDbContext<ElectriCoreContext>(options => options.UseLazyLoadingProxies().UseSqlServer(Configuration.GetConnectionString("ElectriCoreConnection")));
            ConnectionString = Configuration["ConnectionStrings:ElectriCoreConnection"];
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseSession();
            app.UseRouting();
            app.UseAuthorization();
            CurrentHostingEnvironment = env;
            string ContentRootPath = env.ContentRootPath;
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=login}/{action=Index}/{id?}");
            });
        }
    }
}
