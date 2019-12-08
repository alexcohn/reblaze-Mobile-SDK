using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Reblaze.React.Native.Sdk.RNReblazeReactNativeSdk
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNReblazeReactNativeSdkModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNReblazeReactNativeSdkModule"/>.
        /// </summary>
        internal RNReblazeReactNativeSdkModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNReblazeReactNativeSdk";
            }
        }
    }
}
