#pragma checksum "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "29c3d97a8ec4167e96ce6d25857fe4f97f24fdc42644b1a9ef5cc3e1e882ba92"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCoreGeneratedDocument.Views_Home_Index), @"mvc.1.0.view", @"/Views/Home/Index.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"Sha256", @"29c3d97a8ec4167e96ce6d25857fe4f97f24fdc42644b1a9ef5cc3e1e882ba92", @"/Views/Home/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"Sha256", @"f7dbb2c03b15246f2339e928b6e3e747d86a237a9bef432f6d7df1411f143c50", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    internal sealed class Views_Home_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    #nullable disable
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 1 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
  
    ViewData["Title"] = "Home Page";

#line default
#line hidden
#nullable disable

            WriteLiteral("<div class=\"row\">\n    <!-- ICON BG-->\n    <div class=\"col-lg-12 col-md-6 col-sm-6\">\n        <p class=\"text-primary text-24 line-height-1 mb-2\">");
            Write(
#nullable restore
#line 7 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                                            ViewBag.Company.Name

#line default
#line hidden
#nullable disable
            );
            WriteLiteral(@"</p>
    </div>
    <div class=""col-lg-4 col-md-6 col-sm-6"">
        <div class=""card card-icon-bg card-icon-bg-primary o-hidden mb-4"">
            <div class=""card-body text-center"">
                <i class=""i-Add-User""></i>
                <div class=""content"">
                    <p class=""text-muted mt-2 mb-0"">Leads</p>
                    <p class=""text-primary text-24 line-height-1 mb-2"">");
            Write(
#nullable restore
#line 15 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                                                        ViewBag.L

#line default
#line hidden
#nullable disable
            );
            WriteLiteral(@"</p>
                </div>
            </div>
        </div>
    </div>
    <div class=""col-lg-4 col-md-6 col-sm-6"">
        <div class=""card card-icon-bg card-icon-bg-primary o-hidden mb-4"">
            <div class=""card-body text-center"">
                <i class=""i-Add-User""></i>
                <div class=""content"">
                    <p class=""text-muted mt-2 mb-0"">Customer</p>
                    <p class=""text-primary text-24 line-height-1 mb-2"">");
            Write(
#nullable restore
#line 26 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                                                        ViewBag.C

#line default
#line hidden
#nullable disable
            );
            WriteLiteral(@"</p>
                </div>
            </div>
        </div>
    </div>
    <div class=""col-lg-4 col-md-6 col-sm-6"">
        <div class=""card card-icon-bg card-icon-bg-primary o-hidden mb-4"">
            <div class=""card-body text-center"">
                <i class=""i-Add-User""></i>
                <div class=""content"">
                    <p class=""text-muted mt-2 mb-0"">Call Backs</p>
                    <p class=""text-primary text-24 line-height-1 mb-2"">");
            Write(
#nullable restore
#line 37 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                                                        ViewBag.LCB

#line default
#line hidden
#nullable disable
            );
            WriteLiteral(@"</p>
                </div>
            </div>
        </div>
    </div>
    <div class=""col-md-12"">
        <div class=""card o-hidden mb-4"">
            <div class=""card-header d-flex align-items-center"">
                <h3 class=""w-50 float-left card-title m-0"">Call Back Leads</h3>
            </div>
            <div class=""card-body"">

                <div class=""table-responsive"">

                    <table class=""table table-bordered text-center"">
                        <thead>
                            <tr>
");
            WriteLiteral(@"                                <th scope=""col"">Name</th>
                                <th scope=""col"">Phone</th>
                                <th scope=""col"">State</th>
                                <th scope=""col"">City</th>
                                <th scope=""col"">Zip Code</th>
                                <th scope=""col"">Address</th>
                            </tr>
                        </thead>
                        <tbody>
");
#nullable restore
#line 64 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                             if (ViewBag.Leads != null)
                            {
                                

#line default
#line hidden
#nullable disable

#nullable restore
#line 66 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                 foreach (var item in ViewBag.Leads)
                                {

#line default
#line hidden
#nullable disable

            WriteLiteral("                                    <tr>\n                                        <td>");
            Write(
#nullable restore
#line 69 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                             item.FirstName

#line default
#line hidden
#nullable disable
            );
            WriteLiteral(" ");
            Write(
#nullable restore
#line 69 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                                             item.LastName

#line default
#line hidden
#nullable disable
            );
            WriteLiteral("</td>\n                                        <td>");
            Write(
#nullable restore
#line 70 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                             item.HomePhone

#line default
#line hidden
#nullable disable
            );
            WriteLiteral(" / ");
            Write(
#nullable restore
#line 70 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                                               item.MobileNo

#line default
#line hidden
#nullable disable
            );
            WriteLiteral(" / ");
            Write(
#nullable restore
#line 70 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                                                                item.OtherPhone

#line default
#line hidden
#nullable disable
            );
            WriteLiteral("</td>\n                                        <td>");
            Write(
#nullable restore
#line 71 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                             item.StateId

#line default
#line hidden
#nullable disable
            );
            WriteLiteral("</td>\n                                        <td>");
            Write(
#nullable restore
#line 72 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                             item.City

#line default
#line hidden
#nullable disable
            );
            WriteLiteral("</td>\n                                        <td>");
            Write(
#nullable restore
#line 73 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                             item.ZipCode

#line default
#line hidden
#nullable disable
            );
            WriteLiteral("</td>\n                                        <td>");
            Write(
#nullable restore
#line 74 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                             item.Address

#line default
#line hidden
#nullable disable
            );
            WriteLiteral("</td>\n                                    </tr>\n");
#nullable restore
#line 76 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                }

#line default
#line hidden
#nullable disable

#nullable restore
#line 76 "C:\Users\Toheed Aslam\Desktop\CRMEcmaTechSolution-main (1)\CRMEcmaTechSolution-main\ElectriCoreSolution-main\ElectriCore\Views\Home\Index.cshtml"
                                 
                            }

#line default
#line hidden
#nullable disable

            WriteLiteral(@"                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class=""col-md-4"">
        <div class=""card o-hidden mb-4"">
            <div class=""card-header d-flex align-items-center"">
                <h3 class=""w-50 float-left card-title m-0"">States</h3>
            </div>
            <div class=""card-body"">

                <div class=""table-responsive"">

                    <table class=""table table-bordered text-center"">
                        <thead>
                            <tr>
");
            WriteLiteral(@"                                <th scope=""col"">Code</th>
                                <th scope=""col"">State Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>AL</td>
                                <td>Alabama</td>
                            </tr>
                            <tr>
                                <td>AK</td>
                                <td>Alaska</td>
                            </tr>
                            <tr>
                                <td>AZ</td>
                                <td>Arizona</td>
                            </tr>
                            <tr>
                                <td>AR</td>
                                <td>Arkansas</td>
                            </tr>
                            <tr>
                                <td>CA</td>
                                <td>California</td>
                            </tr>
");
            WriteLiteral(@"                            <tr>
                                <td>CT</td>
                                <td>Connecticut</td>
                            </tr>
                            <tr>
                                <td>DE</td>
                                <td>Delaware</td>
                            </tr>
                            <tr>
                                <td>CL</td>
                                <td>District of Columbia</td>
                            </tr>
                            <tr>
                                <td>FL</td>
                                <td>Florida</td>
                            </tr>
                            <tr>
                                <td>GA</td>
                                <td>Georgia</td>
                            </tr>
                            <tr>
                                <td>ID</td>
                                <td>Idaho</td>
                            </tr>
                            <tr>
               ");
            WriteLiteral(@"                 <td>IL</td>
                                <td>Illinois</td>
                            </tr>
                            <tr>
                                <td>IN</td>
                                <td>Indiana</td>
                            </tr>
                            <tr>
                                <td>IA</td>
                                <td>Iowa</td>
                            </tr>
                            <tr>
                                <td>KS</td>
                                <td>Kansas</td>
                            </tr>
                            <tr>
                                <td>KY</td>
                                <td>Kentucky</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class=""col-md-4"">
        <div class=""card o-hidden mb-4"">
            <div class=""card-header d-flex align-items-center"">
            ");
            WriteLiteral(@"    <h3 class=""w-50 float-left card-title m-0"">States</h3>
            </div>
            <div class=""card-body"">

                <div class=""table-responsive"">

                    <table class=""table table-bordered text-center"">
                        <thead>
                            <tr>
");
            WriteLiteral(@"                                <th scope=""col"">Code</th>
                                <th scope=""col"">State Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>LA</td>
                                <td>Louisiana</td>
                            </tr>
                            <tr>
                                <td>ME</td>
                                <td>Maine</td>
                            </tr>
                            <tr>
                                <td>MD</td>
                                <td>Maryland</td>
                            </tr>
                            <tr>
                                <td>MA</td>
                                <td>Massachusetts</td>
                            </tr>
                            <tr>
                                <td>MN</td>
                                <td>Minnesota</td>
                            ");
            WriteLiteral(@"</tr>
                            <tr>
                                <td>MS</td>
                                <td>Mississippi</td>
                            </tr>
                            <tr>
                                <td>MO</td>
                                <td>Missouri</td>
                            </tr>
                            <tr>
                                <td>MT</td>
                                <td>Montana</td>
                            </tr>
                            <tr>
                                <td>NE</td>
                                <td>Nebraska</td>
                            </tr>
                            <tr>
                                <td>NV</td>
                                <td>Nevada</td>
                            </tr>
                            <tr>
                                <td>NH</td>
                                <td>New Hampshire</td>
                            </tr>
                            <tr>
              ");
            WriteLiteral(@"                  <td>NJ</td>
                                <td>New Jersey</td>
                            </tr>
                            <tr>
                                <td>NM</td>
                                <td>New Mexico</td>
                            </tr>
                            <tr>
                                <td>NY</td>
                                <td>New York</td>
                            </tr>
                            <tr>
                                <td>NC</td>
                                <td>North Carolina</td>
                            </tr>
                            <tr>
                                <td>ND</td>
                                <td>North Dakota</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class=""col-md-4"">
        <div class=""card o-hidden mb-4"">
            <div class=""card-header d-flex align-items");
            WriteLiteral(@"-center"">
                <h3 class=""w-50 float-left card-title m-0"">States</h3>
            </div>
            <div class=""card-body"">

                <div class=""table-responsive"">

                    <table class=""table table-bordered text-center"">
                        <thead>
                            <tr>
");
            WriteLiteral(@"                                <th scope=""col"">Code</th>
                                <th scope=""col"">State Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>OH</td>
                                <td>Ohio</td>
                            </tr>
                            <tr>
                                <td>OK</td>
                                <td>Oklahoma</td>
                            </tr>
                            <tr>
                                <td>OR</td>
                                <td>Oregon</td>
                            </tr>
                            <tr>
                                <td>PA</td>
                                <td>Pennsylvania</td>
                            </tr>
                            <tr>
                                <td>RI</td>
                                <td>Rhode Island</td>
                            </");
            WriteLiteral(@"tr>
                            <tr>
                                <td>SC</td>
                                <td>South Carolina</td>
                            </tr>
                            <tr>
                                <td>SD</td>
                                <td>South Dakota</td>
                            </tr>
                            <tr>
                                <td>TN</td>
                                <td>Tennessee</td>
                            </tr>
                            <tr>
                                <td>TX</td>
                                <td>Texas</td>
                            </tr>
                            <tr>
                                <td>UT</td>
                                <td>Utah</td>
                            </tr>
                            <tr>
                                <td>VT</td>
                                <td>Vermont</td>
                            </tr>
                            <tr>
                  ");
            WriteLiteral(@"              <td>VA</td>
                                <td>Virginia</td>
                            </tr>
                            <tr>
                                <td>WA</td>
                                <td>Washington</td>
                            </tr>
                            <tr>
                                <td>WV</td>
                                <td>West Virginia</td>
                            </tr>
                            <tr>
                                <td>WI</td>
                                <td>Wisconsin</td>
                            </tr>
                            <tr>
                                <td>WY</td>
                                <td>Wyoming</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
");
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
