//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace NewArray
{
    using System;
    using System.Collections.Generic;
    
    public partial class Navigation
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Navigation()
        {
            this.NewAries = new HashSet<NewAry>();
            this.UserAries = new HashSet<UserAry>();
            this.ObjectTags = new HashSet<ObjectTag>();
            this.UserFollows = new HashSet<UserFollow>();
        }
    
        public int Nav_ID { get; set; }
        public string Nav_Name { get; set; }
        public int Ower_ID { get; set; }
        public int Nav_FollowNum { get; set; }
        public string Nav_Describe { get; set; }
        public int Nav_Type { get; set; }
        public Nullable<int> Nav_UseNum { get; set; }
        public string Extends1 { get; set; }
        public string Extends2 { get; set; }
        public string Extends3 { get; set; }
        public string Extends4 { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NewAry> NewAries { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserAry> UserAries { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ObjectTag> ObjectTags { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserFollow> UserFollows { get; set; }
    }
}
