using System;

namespace paySolution
{
	public static class markup
	{
		public static string make (string text, 
			string foreground = "black",
			string background = null,
			string size = "large", 
			string weight = "normal", 
			string style = "normal"){

			return string.Format ("<span foreground='{0}' {1} size='{2}' weight='{3}' style='{4}'>{5}</span>", 
				foreground,
				background != null ? background : "",
				size,
				weight,
				style, 
				text);
		}


	}
}

