#pragma checksum "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Leads\Index.cshtml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "ca7739e26b10b9ebd977cb4b22f17113a33df49cff03118e6e61ce3c0e5c7368"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCoreGeneratedDocument.Views_Leads_Index), @"mvc.1.0.view", @"/Views/Leads/Index.cshtml")]
namespace AspNetCoreGeneratedDocument
{
    #line default
    using global::System;
    using global::System.Collections.Generic;
    using global::System.Linq;
    using global::System.Threading.Tasks;
    using global::Microsoft.AspNetCore.Mvc;
    using global::Microsoft.AspNetCore.Mvc.Rendering;
    using global::Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\_ViewImports.cshtml"
using ElectriCore

#nullable disable
    ;
#nullable restore
#line 2 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\_ViewImports.cshtml"
using ElectriCore.Models

#nullable disable
    ;
    #line default
    #line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"Sha256", @"ca7739e26b10b9ebd977cb4b22f17113a33df49cff03118e6e61ce3c0e5c7368", @"/Views/Leads/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"Sha256", @"f7dbb2c03b15246f2339e928b6e3e747d86a237a9bef432f6d7df1411f143c50", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    internal sealed class Views_Leads_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    #nullable disable
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 1 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Leads\Index.cshtml"
   string DataTableColumns =
                "{ \"data\": \"id\",\"searchable\": false,\"bSortable\": true,\"bVisible\": false}," +
                    "{ \"data\": \"sno\"}," +
                            "{ \"data\": \"name\"}," +
                        "{ \"data\": \"address\"}," +
                        "{ \"data\": \"city\"}," +
                            "{ \"data\": \"state\"}," +
                            "{ \"data\": \"zipCode\"}," +
                            "{ \"data\": \"country\"}," +
                            "{ \"data\": \"num\"}," +
                        "{ \"data\": \"email\"}," +
                        "{ \"data\": \"bin\"}," +
                        "{ \"data\": \"cardType\"}";

                ViewBag.DataTableActionColumn = "11";
                DataTableColumns += ",{ \"data\": \"id\",\"searchable\": false,\"bSortable\": false}";
                ViewBag.DataTableColumns = DataTableColumns; 

#line default
#line hidden
#nullable disable

            DefineSection("InLineScriptSection", async() => {
                WriteLiteral("\n    ");
                Write(
#nullable restore
#line 19 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Leads\Index.cshtml"
     await Html.PartialAsync("JsScript")

#line default
#line hidden
#nullable disable
                );
                WriteLiteral("\n");
            }
            );
            WriteLiteral(@"<div class=""col-md-12 mb-4"">
    <div class=""card text-left"">
        <div class=""dataTablePageHeader card-header""></div>
        <div class=""card-body"">
            <div class=""table-responsive"">
                <table class=""display table table-striped table-hover table-bordered datatable"" style=""width:100%"">
                    <thead>
                        <tr>
                            <th></th>
                            <th>S No</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Zip Code</th>
                            <th>Country</th>
                            <th>Number</th>
                            <th>Email</th>
                            <th>Bin</th>
                            <th>Card Type</th>
");
#nullable restore
#line 41 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Leads\Index.cshtml"
                             if (ViewBag.DataTableActionColumn != null)
                            {

#line default
#line hidden
#nullable disable

            WriteLiteral("                                <th data-priority=\"2\">Actions</th>\n");
#nullable restore
#line 44 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Leads\Index.cshtml"
                            }

#line default
#line hidden
#nullable disable

            WriteLiteral("                        </tr>\n                    </thead>\n                </table>\n            </div>\n        </div>\n    </div>\n</div>");
        }
        #pragma warning restore 1998
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
