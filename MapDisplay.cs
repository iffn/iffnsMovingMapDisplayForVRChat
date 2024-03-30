using UdonSharp;
using UnityEditor;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

namespace iffnsStuff.iffnsVRCStuff.iffnsMapDisplay
{
    public class MapDisplay : UdonSharpBehaviour
    {
        [Header("Unity assignments")]
        [SerializeField] Material LinkedMaterial;
        [SerializeField] Transform ArrowHolder;
        [SerializeField] Transform worldLocation;

        [Header("Settings")]
        [SerializeField] Vector2 mapSize = new Vector2(100, 100);
        [SerializeField] Vector3 originOffset;
        [SerializeField] float defaultZoomLevel = 1;

        /*
        float originalWindowSize;
        float originalAspectRatio;
        Vector3 originalWindowPosition;
        */

        float currentInvertedZoomLevel;
        Vector2 invertedMapSize;

        const string windowSizeReference = "_InvertedZoom";
        const string aspectRatioReference = "_AspectRatio";
        const string windowPositionReference = "_WindowPosition";

        //Unity functions
        private void Start()
        {
#if UNITY_EDITOR
            //Backup values, apparently broken
            /*
            originalWindowSize = LinkedMaterial.GetFloat(windowSizeReference);
            originalAspectRatio = LinkedMaterial.GetFloat(aspectRatioReference);
            originalWindowPosition = LinkedMaterial.GetVector(windowPositionReference);
            */
#endif

            currentInvertedZoomLevel = 1 / defaultZoomLevel;
            LinkedMaterial.SetFloat(windowSizeReference, currentInvertedZoomLevel);

            float aspectRatio = mapSize.x / mapSize.y;

            LinkedMaterial.SetFloat(aspectRatioReference, aspectRatio);

            invertedMapSize = new Vector2(1 / mapSize.x, 1 / mapSize.y);
        }

        private void Update()
        {
            Vector3 transformPosition = worldLocation.position;

            Vector3 position01 = new Vector3(
                (transformPosition.x - originOffset.x) * invertedMapSize.x,
                (transformPosition.z - originOffset.z) * invertedMapSize.y,
                0
                );

            LinkedMaterial.SetVector(windowPositionReference, position01);

            float heading = transform.rotation.eulerAngles.y;

            ArrowHolder.localRotation = Quaternion.Euler(0, 0, -heading);
        }

#if UNITY_EDITOR
        private void OnApplicationQuit()
        {
            /*
            //Apparently broken
            LinkedMaterial.SetFloat(windowSizeReference, originalWindowSize);
            LinkedMaterial.SetFloat(aspectRatioReference, originalAspectRatio);
            LinkedMaterial.SetVector(windowPositionReference, originalWindowPosition);
            */
            LinkedMaterial.SetFloat(windowSizeReference, 1);
            LinkedMaterial.SetVector(windowPositionReference, Vector3.zero);
        }
#endif

        //UI events
        public void ZoomIn()
        {
            currentInvertedZoomLevel *= 0.8f;

            LinkedMaterial.SetFloat(windowSizeReference, currentInvertedZoomLevel);
        }

        public void ZoomOut()
        {
            currentInvertedZoomLevel *= 1.25f;

            LinkedMaterial.SetFloat(windowSizeReference, currentInvertedZoomLevel);
        }
    }
}